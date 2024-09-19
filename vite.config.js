import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import melangePlugin from "vite-plugin-melange";
import path from "path";

// https://vitejs.dev/config/
export default defineConfig({
  resolve:  { alias: { "@": path.resolve(__dirname, "./src"), }, },
  plugins: [
	react(),
	melangePlugin({
	  emitDir: "src",
	  buildTarget: "generated",
	  buildCommand: "exit 0",
	  watchCommand: "sleep 1000000",
	})
  ],
})
