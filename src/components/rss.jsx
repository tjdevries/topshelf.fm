import { FaRss } from "react-icons/fa"
import { IconLink } from "./icon-link"

export function RssLink({ url, className = "" }) {
  return (
	  <IconLink icon={<FaRss />} url={url} className={className} />
  )
}
