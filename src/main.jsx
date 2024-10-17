import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import Podcast from "./generated/src/Podcast.js";

if (import.meta.hot) {
  import.meta.hot.accept();
}

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <Podcast />
  </StrictMode>,
);
