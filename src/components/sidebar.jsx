import React from 'react'
import { Button } from "@/components/ui/button"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Youtube, Music2, Headphones, Rss, Music, Radio } from "lucide-react"

export function PodcastSidebar() {
  const subscriptionLinks = [
    { name: 'YouTube', icon: Youtube, url: 'https://youtube.com/neocastfm' },
    { name: 'Spotify', icon: Music2, url: 'https://open.spotify.com/show/neocastfm' },
    { name: 'Apple Podcasts', icon: Music, url: 'https://podcasts.apple.com/podcast/neocastfm' },
    { name: 'Google Podcasts', icon: Headphones, url: 'https://podcasts.google.com/feed/neocastfm' },
    { name: 'RSS Feed', icon: Rss, url: 'https://neocastfm.com/rss' },
    { name: 'Stitcher', icon: Radio, url: 'https://www.stitcher.com/show/neocastfm' },
  ]

  return (
    <div className="bg-gray-900 text-green-400 w-64 h-screen fixed right-0 top-0 transform transition-transform duration-300 ease-in-out lg:translate-x-0 translate-x-full">
      <ScrollArea className="h-full">
        <div className="p-6">
          <h2 className="text-xl font-bold mb-4">Subscribe to NeocastFM</h2>
          <ul className="space-y-4">
            {subscriptionLinks.map((link) => (
              <li key={link.name}>
                <Button
                  variant="ghost"
                  className="w-full justify-start text-green-400 hover:text-black hover:bg-green-400"
                  asChild
                >
                  <a href={link.url} target="_blank" rel="noopener noreferrer">
                    <link.icon className="mr-2 h-4 w-4" />
                    <span className="lg:inline hidden">{link.name}</span>
                  </a>
                </Button>
              </li>
            ))}
          </ul>
        </div>
      </ScrollArea>
      <div className="lg:hidden fixed bottom-4 right-4 bg-gray-900 rounded-full p-2 shadow-lg">
        <Button
          variant="ghost"
          size="icon"
          className="text-green-400 hover:text-black hover:bg-green-400"
          onClick={() => {
            const sidebar = document.querySelector('.transform')
            sidebar.style.transform = sidebar.style.transform === 'translateX(0%)' ? 'translateX(100%)' : 'translateX(0%)'
          }}
        >
          <Headphones className="h-6 w-6" />
        </Button>
      </div>
    </div>
  )
}
