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

// sidebarContent.addEventListener("click", (event) => {
//   const button = (event.target.closest("[data-button-type]") || event.target);
//   const buttonType = button.dataset.buttonType;
//   if (!buttonType) {
//     return;
//   }

//   if (buttonType === "visibility") {
//     toggleLayerVisibility(button);
//   }
// });

function toggleLayerVisibility(button) {
  const layer = button.closest(".layer__item");
  layer.classList.toggle("layer__item--hidden");
}

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

export function initSidebar(callback) {
  sidebarContent.addEventListener("click", (event) => {
    const button = (event.target.closest("[data-button-type]") || event.target);
    const buttonType = button.dataset.buttonType;
    if (!buttonType) {
      return;
    }
  
    if (buttonType === "visibility") {
      toggleLayerVisibility(button);
    }

    callback(buttonType, button.closest(".layer__item"));
  });

}