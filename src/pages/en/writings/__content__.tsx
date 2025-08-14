import type { PageProps, ContentMeta } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';

const EnglishWritingPage = ({ meta }: PageProps) => {
  return <></>;
};

export function getLayout(): string {
  return 'writing.html';
}

export function getPageMeta(): ContentMeta {
  return {
    page_writings: true,
    container_class: 'writing-container',
    collection_name: 'en/writings',
    ...LANGUAGE_CONTEXTS.en
  };
}

export function getContentDir(): string {
  return 'content/en/writings';
}

export function filterContent(meta: ContentMeta, path: string): boolean {
  return true;
}

export default EnglishWritingPage;