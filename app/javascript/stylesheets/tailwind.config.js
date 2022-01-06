module.exports = {
  purge: [
    'app/views/**/*.html.erb',
    'app/builders/**/*.rb',
    'app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
