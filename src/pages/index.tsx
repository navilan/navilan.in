import { DuctPageComponent } from '@duct-ui/router';
import Markdown from '@duct-ui/components/content/markdown/markdown';
import aboutContent from '@snippets/en/about.md?raw';
import { LANGUAGE_CONTEXTS } from '@/lib/language-contexts';

export const getLayout = () => 'page.html';

export const getPageMeta = () => ({
  title: 'navilan - reasonably unfiltered',
  page_about: true,
  container_class: 'about-container',
  hide_menu: true,
  ...LANGUAGE_CONTEXTS.en
});

const IndexPage: DuctPageComponent = () => {
  return (
    <>
      <section class="hero-section">
        <div class="avatar-column">
          <img class="avatar-image" src="/media/images/navilan.png" alt="navilan" />
        </div>
        <div class="content-column">
          <Markdown content={aboutContent} linkTarget="_blank" />
        </div>
      </section>
      
      <nav class="cta-section">
        <a class="cta-button" href="/en/writings">
          <span class="cta-primary">English - ஆங்கிலம்</span>
          <span class="cta-secondary">Writings - எழுத்து</span>
        </a>
        <a class="cta-button" href="/ta/writings">
          <span class="cta-primary">Tamil - தமிழ்</span>
          <span class="cta-secondary">Writings - எழுத்து</span>
        </a>
      </nav>
    </>
  );
};

export default IndexPage;