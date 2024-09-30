import { Button } from "@/components/ui/button"
import { FaYoutube } from "react-icons/fa"

/**
 * Props for the SpotifyLink component
 * @typedef {Object} SpotifyLinkProps
 * @property {string} url - The Spotify URL to link to
 * @property {string} [className] - Optional additional CSS classes
 */

/**
 * A button component that links to a Spotify URL
 * @param {SpotifyLinkProps} props
 * @returns {JSX.Element}
 */
export function YoutubeLink({ url, className = "" }) {
  return (
    <a href={url}>
      <Button
        as="a"
        variant="outline"
        size="lg"
        className={`group relative overflow-hidden border-2 border-primary-400 bg-black text-primary-400 hover:text-black hover:bg-primary-400 ${className}`}
      >
        <span className="relative z-10 flex items-center justify-center">
          <FaYoutube className="mr-4 h-5 w-5" />
        </span>
        <span className="absolute inset-0 z-0 bg-primary-400 transition-transform duration-300 ease-in-out transform translate-y-full group-hover:translate-y-0"></span>
      </Button>
    </a>
  )
}
