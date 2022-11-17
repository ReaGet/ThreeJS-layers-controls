const sidebar = document.querySelector(".sidebar");
const sidebarContent = sidebar.querySelector(".sidebar__content");
const sidebarToggleBtn = sidebar.querySelector(".sidebar__footer-toggle");
const sidebarSelectAll = sidebar.querySelector(".sidebar__footer-checkbox");

sidebarToggleBtn.addEventListener("click", () => sidebar.classList.toggle("expanded"));

sidebarSelectAll.addEventListener("change", (event) => {
  const value = event.target.checked;
  toggleLayersCheckboxes(value);
});

sidebarContent.addEventListener("change", (event) => {
  const checkbox = event.target
  if (checkbox.tagName !== "INPUT") {
    return;
  }
  toggleLayerItemClass(checkbox);
});

function toggleLayerItemClass(checkbox) {
  const parent = checkbox.closest(".layer__item");
  parent.classList[checkbox.checked ? "add" : "remove"]("selected");
}

function toggleLayersCheckboxes(value) {
  const layersCheckboxes = sidebar.querySelectorAll(".layer__item .layer__checkbox");
  layersCheckboxes.forEach((checkbox) => {
    checkbox.checked = value;
    toggleLayerItemClass(checkbox);
  });
}