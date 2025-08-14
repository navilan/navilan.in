import { DuctPageComponent } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';
import Markdown from '@duct-ui/components/content/markdown/markdown';
import aboutContent from '@snippets/ta/about.md?raw';

export const getLayout = () => 'page.html';

export const getPageMeta = () => ({
  title: 'நவிலன் - எண்ணக்கூவல்',
  page_about: true,
  container_class: 'about-container',
  ...LANGUAGE_CONTEXTS.ta
});

const TamilHomePage: DuctPageComponent = () => {
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
    </>
  );
};

export default TamilHomePage;