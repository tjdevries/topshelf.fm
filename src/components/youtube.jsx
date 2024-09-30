import { FaYoutube } from "react-icons/fa"
import { IconLink } from "./icon-link"

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
		<IconLink icon={<FaYoutube />} url={url} className={className} />
	)
}
