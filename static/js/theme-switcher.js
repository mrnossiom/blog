// Allow to force light/dark theme while respecting media query by default.
// Detects user preference on load and applies it if necessary.
// 
// Script must be loaded with `defer`.
// 
// # Functions
// 
// - `setTheme`: forces the given theme by setting `data-theme` attribute on
//   the root element. Also store user preference in local storage. Finally,
//   adds custom style to `.theme-reset` element.
// 
// - `switchTheme`: forces the variant opposed to the current one using `setTheme`.
// 
// - `resetTheme`: removes all forced theme data, and uses the detected user
//   preference though a color scheme media query.
//
// # Elements
//
// - `.theme-switch`: gets `click` and `keydown` events that call `switchTheme`
// 
// - `.theme-reset`: gets `click` and `keydown` events that call `resetTheme`

const switchButton = document.querySelector(".theme-switch");
const resetButton = document.querySelector(".theme-reset");

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
    resetButton.classList.add("has-custom-theme");
}

function switchTheme() {
    setTheme(currentTheme === 'dark' ? 'light' : 'dark', true);
}

function resetTheme() {
    document.documentElement.removeAttribute('data-theme');
    currentTheme = getSystemThemePreference();
    localStorage.removeItem('theme');
    resetButton.classList.remove("has-custom-theme");
}

switchButton.addEventListener("click", _ => switchTheme());
switchButton.addEventListener("keydown", (event) => {
    if (event.key != "Enter") return;
    event.preventDefault();

    switchTheme();
});

resetButton.addEventListener("click", _ => resetTheme());
resetButton.addEventListener("keydown", (event) => {
    if (event.key != "Enter") return;
    event.preventDefault();

    resetTheme();
});

// If there is a local user preference, apply it.
if (localStorage.getItem("theme")) {
    setTheme(currentTheme);
}
