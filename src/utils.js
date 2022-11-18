export async function getModelsData(callback) {
  await fetch("../php/requests.php?getIds=1")
    .then(response => response.json())
    .then(callback);
}