import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import Generated from './generated/src/Hello.js';
// import Counter from './generated/src/Counter.js';
import './index.css'

console.log(Generated);

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
