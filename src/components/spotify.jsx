import { FaSpotify } from "react-icons/fa"
import { IconLink } from "./icon-link"

export function SpotifyLink({ url, className = "" }) {
  return (
	  <IconLink icon={<FaSpotify />} url={url} className={className} />
  )
}
