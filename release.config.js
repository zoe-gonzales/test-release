module.exports = {
  branches: [
    "+([0-9])?(.{+([0-9]),x}).x",
    "main",
    { name: "next", channel: "channel-next" },
    "next-major",
  ],
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    [
      "@semantic-release/github",
      {
        successComment:
          ":rocket: This pull request is included in version ${nextRelease.version}.",
        releasedLabels: [":rocket: released"],
      },
    ],
  ],
};

// bug fix
// feat on next
// breaking feat on next
// fix on feat on next
// another breaking change
// test after setting channel
// test again
