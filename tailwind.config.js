/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#b32b29',
          600: '#a11d1b',
          700: '#8f1816',
          800: '#7d1412',
          900: '#6b100e',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
};