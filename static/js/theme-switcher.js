// Provides two functions to force light/dark theme.
// - `switchTheme`: guesses the current theme and forces the other variant
//   though `data-theme` root element attribute.
// - `resetTheme`: removes all forced theme data on page, and lets CSS detect
//   user preference though media queries.
//
// Script must be loaded deferly to properly work

const themeResetter = document.querySelector(".theme-resetter");

function getSystemThemePreference() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}

let currentTheme =
    localStorage.getItem("theme") ||
    document.documentElement.getAttribute("data-theme") ||
    getSystemThemePreference();

function setTheme(theme) {
    document.documentElement.setAttribute("data-theme", theme);
    currentTheme = theme;
    localStorage.setItem('theme', theme);
    themeResetter.classList.add("has-custom-theme");
}

// ——— Exports

function switchTheme() {
    setTheme(currentTheme === 'dark' ? 'light' : 'dark', true);
}

function resetTheme() {
    document.documentElement.removeAttribute('data-theme');
    currentTheme = getSystemThemePreference();
    localStorage.removeItem('theme');
    themeResetter.classList.remove("has-custom-theme");
}
