import * as THREE from 'three';

import {
  OrbitControls
} from 'three/addons/OrbitControls.js';

import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { initSidebar } from "./script.js";
import { getModelsData } from "./utils.js";

let cameraPersp, currentCamera;
let scene, renderer, orbit;
let modelLoader = null;

init();
render();

function init() {

  renderer = new THREE.WebGLRenderer();
  renderer.setPixelRatio(window.devicePixelRatio);
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.body.appendChild(renderer.domElement);

  const aspect = window.innerWidth / window.innerHeight;

  cameraPersp = new THREE.PerspectiveCamera(50, aspect, 0.01, 30000);
  currentCamera = cameraPersp;

  currentCamera.position.set(1000, 500, 1000);
  currentCamera.lookAt(0, 200, 0);

  scene = new THREE.Scene();
  scene.add(new THREE.GridHelper(1000, 10, 0x888888, 0x444444));

  const light = new THREE.DirectionalLight(0xffffff, 2);
  light.position.set(1, 1, 1);
  scene.add(light);

  const texture = new THREE.TextureLoader().load('./assets/textures/crate.gif', render);
  texture.anisotropy = renderer.capabilities.getMaxAnisotropy();

  modelLoader = new GLTFLoader();
  // let car = null;
  // modelLoader.load(`./assets/car2/source/car.glb`, function (object) {
  //   car = object.scene;
  //   car.scale.set(200, 200, 200);
  //   car.position.x = -290;
  //   car.position.y = 0;
  //   car.position.z = -320;

  //   scene.add(car);
  //   render();
  // }, function (xhr) {
  // }, function (error) {
  //     console.log('error')
  // });

  getModelsData((data) => {
    data.map((modelData) => {
      loadModel(modelData.alias)
    });
  })

  orbit = new OrbitControls(currentCamera, renderer.domElement);
  orbit.update();
  orbit.addEventListener('change', render);

  window.addEventListener('resize', onWindowResize);

  initSidebar((buttonType, layer) => {
    if (buttonType === "visibility") {
      const hidden = layer.classList.contains("layer__item--hidden");
      const names = layer.dataset.layerObjects.split(",");
      scene.children.forEach(child => {
        console.log(child)
        if (names.includes(child.name)) {
          child.visible = !hidden;
        }
      });
    }
    render();
  })
}

function loadModel(alias) {
  modelLoader.load(`./assets/${alias}/source/${alias}.glb`, function (object) {
    let model = object.scene;
    model.scale.set(200, 200, 200);
    model.position.x = Math.random() * 1000 - 500;
    model.position.y = 0;
    model.position.z = Math.random() * 1000 - 500;
    model.name = alias;

    scene.add(model);
    render();
  }, function (xhr) {
  }, function (error) {
      console.log('error', alias)
  });
}

function onWindowResize() {

  const aspect = window.innerWidth / window.innerHeight;

  cameraPersp.aspect = aspect;
  cameraPersp.updateProjectionMatrix();

  renderer.setSize(window.innerWidth, window.innerHeight);

  render();

}

function render() {

  renderer.render(scene, currentCamera);
  // Box3Helper.update();

}