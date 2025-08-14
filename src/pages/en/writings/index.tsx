import { DuctPageComponent } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';

export const getLayout = () => 'list.html';

export const getContent = () => {
  return {
    pattern: 'en/writings/**/*.md',
    sortBy: 'date',
    sortOrder: 'desc',
    limit: 20
  };
};

export const getPageMeta = () => ({
  title: 'Writings',
  page_writings: true,
  container_class: 'writing-list-container',
  collection_name: 'en/writings',
  postsPerPage: 12,
  ...LANGUAGE_CONTEXTS.en
});

const EnglishWritingsPage: DuctPageComponent = () => {
  return <></>;
};

export default EnglishWritingsPage;