import { DateTime } from 'luxon'
import { parseMarkdown } from './src/markdown-parser.js'


// Custom Nunjucks filter to replace $relToAbs()
function relToAbs(assetPath, contentPath) {
  // Handle the contentPath which comes from page context
  if (!contentPath) return assetPath;

  // Extract directory from content path
  // e.g., /en/writings/2024/2024-01-01-title.html -> /en/writings/2024/
  const dir = path.dirname(contentPath);

  // Join with asset path and normalize
  const fullPath = path.join(dir, assetPath);

  // Ensure it starts with /
  return fullPath.startsWith('/') ? fullPath : '/' + fullPath;
}

// Extract language from path
function getLangFromPath(filepath) {
  if (!filepath) return 'en';
  if (filepath.includes('/ta/')) return 'ta';
  return 'en';
}

// Language-specific context
function getLanguageContext(lang) {
  if (lang === 'ta') {
    return {
      'lang': 'ta',
      'lang-ta': true,
      'lang-site-name': 'நவிலன்',
      'lang-site-title': 'எண்ணக்கூவல்',
      'lang-about-name': 'இவன்',
      'lang-writings-name': 'எழுத்து',
      'lang-read-more': 'திற'
    };
  }
  return {
    'lang': 'en',
    'lang-en': true,
    'lang-site-name': 'navilan',
    'lang-site-title': 'reasonably unfiltered',
    'lang-about-name': 'about',
    'lang-writings-name': 'writings',
    'lang-read-more': 'Read'
  };
}

export default {
  contentDir: 'content',
  pagesDir: 'src/pages',
  layoutsDir: 'src/layouts',

  content: {
    excerptMarker: '<!--more-->',
    markdownParser: parseMarkdown
  },

  nunjucks: {
    filters: {
      date: (date, format = 'LLL dd, yyyy') => {
        if (!date) return ''
        const dt = DateTime.fromISO(date)
        if (!dt.isValid) {
          // Try parsing as a regular date if ISO format fails
          const parsedDt = DateTime.fromJSDate(new Date(date))
          return parsedDt.isValid ? parsedDt.toFormat(format) : date
        }
        return dt.toFormat(format)
      },
      // Match Hakyll's $relToAbs("image.jpg")$ behavior
      relToAbs: function(assetPath) {
        // In Nunjucks context, 'this' contains the page context
        const ctx = this.ctx || this;
        const currentPath = ctx.page?.path || ctx.url || '';
        return relToAbs(assetPath, currentPath);
      },

      // Language URL helper
      langUrl: (lang, url) => url.replace('#lang#', lang),

      // Math helper filters
      min: (arr) => Math.min(...arr)
    },

    globals: {
      // Make language detection available globally
      getLangFromPath: getLangFromPath,

      // Get full language context - renamed to avoid confusion with Nunjucks context
      getLangContext: function(filepath) {
        const lang = getLangFromPath(filepath);
        return getLanguageContext(lang);
      }
    },

    // Additional Nunjucks options
    options: {
      autoescape: false,  // Don't escape HTML in markdown content
      throwOnUndefined: false,
      trimBlocks: true,
      lstripBlocks: true
    }
  },

  // Environment variables available in pages
  env: {
    siteUrl: 'https://navilan.in',
    siteName: 'navilan',
    languages: ['en', 'ta']
  }
}