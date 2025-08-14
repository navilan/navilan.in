import { DuctPageComponent } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';

export const getLayout = () => 'list.html';

export const getContent = () => {
  return {
    pattern: 'ta/writings/**/*.md',
    sortBy: 'date',
    sortOrder: 'desc',
    limit: 20
  };
};

export const getPageMeta = () => ({
  title: 'எழுத்து',
  page_writings: true,
  container_class: 'writing-list-container',
  collection_name: 'ta/writings',
  postsPerPage: 12,
  ...LANGUAGE_CONTEXTS.ta
});

const TamilWritingsPage: DuctPageComponent = () => {
  return <></>;
};

export default TamilWritingsPage;