import { defineConfig } from 'vite';
import { resolve } from 'path';
import { ductSSGPlugin } from '@duct-ui/cli/vite-plugin';

const root = resolve(__dirname);


export default defineConfig({
  plugins: [
    ductSSGPlugin()
  ],
  root: '.',
  publicDir: 'public',
  build: {
    outDir: 'dist',
    emptyOutDir: true
  },
  resolve: {
    alias: {
      '@': resolve(root, 'src'),
      '@lib': resolve(root, 'src/lib'),
      '@snippets': resolve(root, 'src/snippets')
    }
  },
  server: {
    port: 3000
  },
  optimizeDeps: {
    // Force Vite to watch these files for changes
    include: ['src/markdown-parser.js']
  }
});