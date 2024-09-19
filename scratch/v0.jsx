
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Terminal, Headphones, Rss } from "lucide-react"
import Link from "next/link"

export default function Component() {
  const episodes = [
    { id: 1, title: "Getting Started with Neovim", duration: "32:15" },
    { id: 2, title: "Advanced Keybindings", duration: "28:45" },
    { id: 3, title: "Plugin Management in Neovim", duration: "35:20" },
    { id: 4, title: "Customizing Your Neovim Setup", duration: "40:10" },
    { id: 5, title: "Neovim vs Vim: The Great Debate", duration: "45:30" },
  ]

  return (
    <div className="min-h-full bg-black text-green-400 font-mono">
      <header className="p-6 border-b border-green-400">
        <div className="container mx-auto flex justify-between items-center">
          <div className="flex items-center space-x-2">
            <Terminal className="w-8 h-8" />
            <h1 className="text-2xl font-bold">NeocastFM</h1>
          </div>
          <nav>
            <ul className="flex space-x-4">
              <li><Link href="#" className="hover:text-white transition-colors">Home</Link></li>
              <li><Link href="#" className="hover:text-white transition-colors">Episodes</Link></li>
              <li><Link href="#" className="hover:text-white transition-colors">About</Link></li>
            </ul>
          </nav>
        </div>
      </header>
      <main className="container mx-auto px-6 py-12">
        <section className="mb-12 text-center">
          <h2 className="text-4xl font-bold mb-4">Welcome to NeocastFM</h2>
          <p className="text-xl mb-6">Your retro-futuristic podcast about all things Neovim</p>
          <Button className="bg-green-400 text-black hover:bg-green-300">
            <Headphones className="mr-2 h-4 w-4" /> Listen Now
          </Button>
        </section>
        <section>
          <h3 className="text-2xl font-bold mb-6">Latest Episodes</h3>
          <div className="space-y-4">
            {episodes.map((episode) => (
              <div key={episode.id} className="border border-green-400 p-4 rounded-md hover:bg-green-400 hover:text-black transition-colors">
                <div className="flex justify-between items-center">
                  <h4 className="text-lg font-semibold">{episode.title}</h4>
                  <span className="text-sm">{episode.duration}</span>
                </div>
                <Button variant="outline" className="mt-2 text-xs border-green-400 text-green-400 hover:bg-green-400 hover:text-black">
                  Play Episode
                </Button>
              </div>
            ))}
          </div>
        </section>
      </main>
      <footer className="border-t border-green-400 mt-12 py-6">
        <div className="container mx-auto px-6 flex justify-between items-center">
          <p>&copy; 2023 NeocastFM. All rights reserved.</p>
          <div className="flex items-center space-x-4">
            <Input type="email" placeholder="Enter your email" className="bg-transparent border-green-400 text-green-400 placeholder-green-600" />
            <Button className="bg-green-400 text-black hover:bg-green-300">
              <Rss className="mr-2 h-4 w-4" /> Subscribe
            </Button>
          </div>
        </div>
      </footer>
    </div>
  )
}
