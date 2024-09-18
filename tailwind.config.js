/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/generated/src/**/*.{js,jsx,ts,tsx}",
	"./vendor/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

