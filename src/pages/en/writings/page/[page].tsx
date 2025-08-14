import { ContentFile, DuctPageComponent } from '@duct-ui/router';
import { LANGUAGE_CONTEXTS } from '@lib/language-contexts';

export const getLayout = () => 'list.html';

export const getContent = () => {
  return {
    pattern: 'en/writings/**/*.md',
    sortBy: 'date',
    sortOrder: 'desc'
  };
};

export const getPageMeta = () => {

  return {
    title: `Writings`,
    page_writings: true,
    container_class: 'writing-list-container',
    collection_name: 'en/writings',
    postsPerPage: 12,
    ...LANGUAGE_CONTEXTS.en
  };
};

export async function getRoutes(content?: Map<string, ContentFile[]>): Promise<Record<string, any>> {
  const routes: Record<string, any> = {}

  if (!content) {
    return routes
  }

  const blogPosts = content.get('en/writings') || []
  const postsPerPage = 12
  const totalPosts = blogPosts.length
  const totalPages = Math.ceil(totalPosts / postsPerPage)

  // Generate routes for pages 2 and beyond (page 1 is handled by the main blog route)
  for (let page = 2; page <= totalPages; page++) {
    routes[`/en/writings/page/${page}`] = {
      currentPage: page,
      postsPerPage
    }
  }

  return routes
}

const EnglishWritingsPaginationPage: DuctPageComponent = () => {
  return <></>;
};

export default EnglishWritingsPaginationPage;