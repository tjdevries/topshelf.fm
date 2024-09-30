import { Button } from "@/components/ui/button"

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
export function IconLink({ icon, url, className = "" }) {
  return (
    <a href={url}>
      <Button
        as="a"
        variant="outline"
        size="icon"
        className={`group relative overflow-hidden border-2 border-primary-400 bg-black text-primary-400 hover:text-black hover:bg-primary-400 ${className}`}
      >
        <span className="relative z-10 flex items-center justify-center">
		  {icon}
        </span>
        <span className="absolute inset-0 z-0 bg-primary-400 transition-transform duration-300 ease-in-out transform translate-y-full group-hover:translate-y-0"></span>
      </Button>
    </a>
  )
}
