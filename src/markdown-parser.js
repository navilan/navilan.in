import MarkdownIt from 'markdown-it'
import markdownItPrism from 'markdown-it-prism'
import markdownItAttrs from 'markdown-it-attrs'
import markdownItAnchor from 'markdown-it-anchor'
import markdownItContainer from 'markdown-it-container'
import markdownItFootnote from 'markdown-it-footnote'
import markdownItTaskLists from 'markdown-it-task-lists'

// Import Prism language components for syntax highlighting
import 'prismjs/components/prism-javascript.js'
import 'prismjs/components/prism-typescript.js'
import 'prismjs/components/prism-jsx.js'
import 'prismjs/components/prism-tsx.js'
import 'prismjs/components/prism-css.js'
import 'prismjs/components/prism-scss.js'
import 'prismjs/components/prism-json.js'
import 'prismjs/components/prism-yaml.js'
import 'prismjs/components/prism-markdown.js'
import 'prismjs/components/prism-bash.js'
import 'prismjs/components/prism-shell-session.js'
import 'prismjs/components/prism-diff.js'

/**
 * Create a configured markdown-it instance with essential plugins
 */
export function createMarkdownParser() {
  const md = new MarkdownIt({
    html: true,        // Enable HTML tags in source
    linkify: true,     // Autoconvert URL-like text to links
    typographer: true, // Enable smart quotes and other typography
    breaks: false,      // Convert '\n' in paragraphs into <br>
  })

  // Add syntax highlighting with Prism
  md.use(markdownItPrism, {
    highlightInlineCode: true,
    init: () => {
      // Prism is already configured with language components above
    }
  })

  // Add attributes support {.class #id key=value}
  md.use(markdownItAttrs, {
    leftDelimiter: '{',
    rightDelimiter: '}',
    allowedAttributes: ['id', 'class', 'target', 'rel', 'title', 'alt']
  })

  // Add automatic header anchors
  md.use(markdownItAnchor, {
    permalink: markdownItAnchor.permalink.linkInsideHeader({
      symbol: '🔗',
      renderAttrs: (slug, state) => ({ 'aria-label': `Permalink to "${slug}"` }),
    }),
    level: [1, 2, 3, 4, 5, 6],
    slugify: (s) => s
      .toLowerCase()
      .replace(/[^\w\s-]/g, '') // Remove special characters
      .replace(/\s+/g, '-')     // Replace spaces with hyphens
      .replace(/--+/g, '-')     // Replace multiple hyphens with single
      .replace(/^-+|-+$/g, '')  // Trim hyphens from start/end
  })

  // Add footnotes support
  md.use(markdownItFootnote)

  // Add task lists support
  md.use(markdownItTaskLists, {
    enabled: true,  // Enable clickable checkboxes
    label: true     // Wrap task items in <label> elements
  })

  // Add custom containers for layout classes
  md.use(markdownItContainer, 'teaser-row-12', {
    validate: function(params) {
      return params.trim().match(/^teaser-row-12$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        // opening tag
        return '<div class="teaser-only row gld-12">\n';
      } else {
        // closing tag
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'centered-row-12', {
    validate: function(params) {
      return params.trim().match(/^centered-row-12$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="w-full flex justify-center text-lg items-center"><div class="text-center">\n';
      } else {
        return '</div></div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'row-12', {
    validate: function(params) {
      return params.trim().match(/^row-12$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="w-full">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  // Add image layout containers
  md.use(markdownItContainer, 'row-wise', {
    validate: function(params) {
      return params.trim().match(/^row-wise$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="row-wise">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'row-wise-wider', {
    validate: function(params) {
      return params.trim().match(/^row-wise-wider$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="row-wise-wider">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'row-wise-full', {
    validate: function(params) {
      return params.trim().match(/^row-wise-full$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="row-wise-full">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'col-wise', {
    validate: function(params) {
      return params.trim().match(/^col-wise$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="col-wise">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'col-wise-wider', {
    validate: function(params) {
      return params.trim().match(/^col-wise-wider$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="col-wise-wider">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'col-wise-full', {
    validate: function(params) {
      return params.trim().match(/^col-wise-full$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="col-wise-full">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'fullwidth', {
    validate: function(params) {
      return params.trim().match(/^fullwidth$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="fullwidth">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'zoomable-fullwidth', {
    validate: function(params) {
      return params.trim().match(/^zoomable-fullwidth$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        return '<div class="zoomable fullwidth">\n';
      } else {
        return '</div>\n';
      }
    }
  })

  md.use(markdownItContainer, 'youtube', {
    validate: function(params) {
      return params.trim().match(/^youtube$/);
    },
    render: function (tokens, idx) {
      if (tokens[idx].nesting === 1) {
        // opening tag - find and process all tokens until closing
        let content = '';
        let closeIdx = -1;
        
        // Find the closing container token
        for (let i = idx + 1; i < tokens.length; i++) {
          if (tokens[i].type === 'container_youtube_close') {
            closeIdx = i;
            break;
          }
        }
        
        // Process all tokens between open and close, extracting URL and hiding them
        for (let i = idx + 1; i < closeIdx; i++) {
          const token = tokens[i];
          
          if (token.type === 'paragraph_open') {
            const inlineToken = tokens[i + 1];
            if (inlineToken && inlineToken.type === 'inline') {
              // Check for linkified content in children
              if (inlineToken.children && inlineToken.children.length > 0) {
                const linkToken = inlineToken.children.find(t => t.type === 'link_open');
                if (linkToken) {
                  content = linkToken.attrGet('href');
                } else if (inlineToken.content) {
                  content = inlineToken.content.trim();
                }
              } else if (inlineToken.content) {
                content = inlineToken.content.trim();
              }
            }
            
            // Clear the tokens completely
            tokens[i].content = '';     // paragraph_open
            tokens[i + 1].content = ''; // inline
            tokens[i + 1].children = []; // clear children to prevent linkify
            tokens[i + 2].content = ''; // paragraph_close
            i += 2; // Skip the cleared tokens
          } else if (token.type === 'inline' && token.content) {
            content = token.content.trim();
            token.content = '';
            token.children = [];
          }
        }
        
        if (content) {
          // Extract video ID and preserve query parameters
          let videoId = '';
          let queryParams = '';
          
          if (content.includes('youtube.com/embed/')) {
            const parts = content.split('embed/')[1];
            videoId = parts.split(/[?&]/)[0];
            if (parts.includes('?')) {
              queryParams = '?' + parts.split('?')[1];
            }
          } else if (content.includes('youtube.com/watch?v=')) {
            const urlParams = new URLSearchParams(content.split('?')[1]);
            videoId = urlParams.get('v');
            urlParams.delete('v');
            const timeParam = urlParams.get('t');
            if (timeParam) {
              urlParams.delete('t');
              urlParams.set('start', timeParam.replace('s', ''));
            }
            const params = urlParams.toString();
            if (params) {
              queryParams = '?' + params;
            }
          } else if (content.includes('youtu.be/')) {
            const parts = content.split('youtu.be/')[1];
            videoId = parts.split(/[?&]/)[0];
            if (parts.includes('?')) {
              queryParams = '?' + parts.split('?')[1];
            }
          } else {
            const parts = content.split('?');
            videoId = parts[0];
            if (parts[1]) {
              queryParams = '?' + parts[1];
            }
          }
          
          if (videoId) {
            return `<div class="youtube">
<iframe src="https://www.youtube.com/embed/${videoId}${queryParams}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>\n`;
          }
        }
        
        return '<div class="youtube">\n';
      } else {
        // closing tag
        return '</div>\n';
      }
    }
  })

  // Add custom renderer to demote headings by one level
  const defaultHeadingOpenRenderer = md.renderer.rules.heading_open || function(tokens, idx, options, env, renderer) {
    return renderer.renderToken(tokens, idx, options);
  };

  const defaultHeadingCloseRenderer = md.renderer.rules.heading_close || function(tokens, idx, options, env, renderer) {
    return renderer.renderToken(tokens, idx, options);
  };

  md.renderer.rules.heading_open = function(tokens, idx, options, env, renderer) {
    const token = tokens[idx];
    const currentLevel = parseInt(token.tag.substring(1)); // Extract number from 'h1', 'h2', etc.
    const newLevel = Math.min(currentLevel + 1, 6); // Demote by one level, max h6
    
    // Create a new token with the demoted level
    const newToken = Object.assign({}, token);
    newToken.tag = 'h' + newLevel;
    
    return renderer.renderToken([newToken], 0, options);
  };

  md.renderer.rules.heading_close = function(tokens, idx, options, env, renderer) {
    const token = tokens[idx];
    const currentLevel = parseInt(token.tag.substring(1));
    const newLevel = Math.min(currentLevel + 1, 6);
    
    const newToken = Object.assign({}, token);
    newToken.tag = 'h' + newLevel;
    
    return renderer.renderToken([newToken], 0, options);
  };

  // Add custom renderer for external links
  const defaultLinkOpenRenderer = md.renderer.rules.link_open || function(tokens, idx, options, env, renderer) {
    return renderer.renderToken(tokens, idx, options);
  };

  md.renderer.rules.link_open = function (tokens, idx, options, env, renderer) {
    const token = tokens[idx];
    const href = token.attrGet('href');

    // Add target="_blank" and security attributes to external links
    if (href && (href.startsWith('http://') || href.startsWith('https://')) && !href.includes(env.siteUrl || '')) {
      token.attrSet('target', '_blank');
      token.attrSet('rel', 'noopener noreferrer');
    }

    return defaultLinkOpenRenderer(tokens, idx, options, env, renderer);
  };

  return md;
}

/**
 * Default markdown parser function for Duct config
 */
export function parseMarkdown(markdown) {
  const md = createMarkdownParser();
  return md.render(markdown);
}