import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    port: 3000,
    hmr: {
      port: 80, // we use a proxy in front of vite, so ws need to pass by it instead of 3000
    },
  },
});
