import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <h1>TOP SHELF DOT FM</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          visitors: {count}
        </button>
      </div>
    </>
  )
}

export default App
