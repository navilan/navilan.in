import type { PageProps, ContentMeta } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';

const TamilWritingPage = ({ meta }: PageProps) => {
  return <></>;
};

export function getLayout(): string {
  return 'writing.html';
}

export function getPageMeta(): ContentMeta {
  return {
    page_writings: true,
    container_class: 'writing-container',
    collection_name: 'ta/writings',
    ...LANGUAGE_CONTEXTS.ta
  };
}

export function getContentDir(): string {
  return 'content/ta/writings';
}

export function filterContent(meta: ContentMeta, path: string): boolean {
  return true;
}

export default TamilWritingPage;