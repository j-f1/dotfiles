// https://github.com/johnste/finicky/wiki/Configuration

const match = {
  /**
   * @param {string} host
   * @returns {import("./.finicky-types").MatcherFunction}
   */
  host:
    (host) =>
    ({ url }) =>
      url.host === host,
  /**
   * @param {string} host
   * @param {string} path
   * @returns {import("./.finicky-types").MatcherFunction}
   */
  path:
    (host, path) =>
    ({ url }) =>
      url.host === host && url.pathname.startsWith(path),
  /**
   * @param {string} protocol
   * @returns {import("./.finicky-types").MatcherFunction}
   */
  protocol:
    (protocol) =>
    ({ url }) =>
      url.protocol === protocol,
};

/**
 * @param {string} query
 * @param {string} key
 */
const getParam = (query, key) => {
  const params = query.split("&");
  const parsed = params.map((p) => p.split("="));
  const match = parsed.find((p) => p[0] == key);
  if (match) return decodeURIComponent(match[1]);
};

/**
 * @param {string} host
 * @param {string} protocol
 */
const rewriteHostToProtocol = (host, protocol) => ({
  match: match.host(host),
  url: ({ url }) => ({ ...url, protocol }),
});

const workOrgs = ["neevaco"];

/** @type {import("./.finicky-types").FinickyConfig} */
module.exports = {
  defaultBrowser: "Safari Technology Preview",
  handlers: [
    {
      match: ({ url }) =>
        url.host === "github.com" &&
        workOrgs.some((org) => url.pathname.startsWith(`/${org}/`)),
      browser: "Google Chrome",
    },
    {
      match: match.host("gather.town"),
      // browser: "Gather",
      browser: "Google Chrome",
    },
    {
      match: match.host("apps.apple.com"),
      browser: "App Store",
    },
    {
      match: match.host("music.apple.com"),
      browser: "Music",
    },
    {
      match: match.protocol("zoommtg"),
      browser: "us.zoom.xos",
    },
    {
      match: ({ keys }) => keys.function,
      browser: "Browserosaurus",
    },
    {
      match: match.protocol("discord"),
      browser: "Discord Canary",
    },
    {
      match: match.host("www.courtlistener.com"),
      browser: "Firefox",
    },
  ],
  rewrite: [
    {
      // https://l.facebook.com/l.php?u=https%253A%252F%252Ftest.jedfox.com%252F&h=[snip]&s=1
      match: match.host("l.facebook.com"),
      url: ({ url }) => {
        const dest = getParam(url.search, "u");
        if (dest) {
          return decodeURI(decodeURIComponent(decodeURIComponent(dest)));
        } else {
          return url;
        }
      },
    },
    {
      match: ({ url }) =>
        url.host.endsWith("zoom.us") && url.pathname.startsWith("/j/"),
      url: ({ url }) => {
        const id = url.pathname.match(/^\/j\/([^/]+)/)?.[1];
        return id ? `zoommtg://zoom.us/join?confno=${id}&${url.search}` : url;
      },
    },
    {
      // https://l.facebook.com/l.php?u=https%253A%252F%252Ftest.jedfox.com%252F&h=[snip]&s=1
      match: match.host("discord.gg"),
      url: ({ url }) => `https://discord.com/invite${url.pathname}`,
    },
    rewriteHostToProtocol("music.apple.com", "itms"),
    rewriteHostToProtocol("discord.com", "discord"),
  ],
  options: {
    // urlShorteners: (list) => [...list, 'l.facebook.com']
  },
};
