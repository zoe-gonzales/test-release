module.exports = {
  branches: ["+([0-9])?(.{+([0-9]),x}).x", "main", "next", "next-major"],
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    [
      "@semantic-release/github",
      {
        successComment:
          ":rocket: This pull request is included in version ${nextRelease.version}.",
        releasedLabels: [":rocket: released"],
        publish: false,
      },
    ],
  ],
};

// bug fix
// feat on next
// breaking feat on next
