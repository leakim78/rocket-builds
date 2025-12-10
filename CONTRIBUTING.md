# Contributing to rocket-builds

This repository is a distribution point for pre-built fat-JAR files from the rocket project.

## For Maintainers

### Automated Synchronization

The repository includes GitHub Actions workflows that can automatically sync releases from the source rocket repository.

#### Automatic Sync (Scheduled)

The `sync-releases.yml` workflow runs every 6 hours and checks for new releases in the rocket repository.

#### Manual Sync

You can manually trigger a sync:

1. Go to Actions → "Sync Releases from Rocket Repo"
2. Click "Run workflow"
3. Optionally specify:
   - Source repository (default: `leakim78/rocket`)
   - Specific tag name (leave empty for latest)

### Manual Release

To create a release manually:

#### Option 1: Using GitHub Actions

1. Go to Actions → "Manual Release"
2. Click "Run workflow"
3. Enter the version number
4. Add release notes
5. After the workflow completes, upload your JAR file(s) to the created release

#### Option 2: Using Git and GitHub CLI

```bash
# 1. Add your JAR file to the releases directory
VERSION="1.0.0"
mkdir -p "releases/v${VERSION}"
cp /path/to/your/rocket.jar "releases/v${VERSION}/"

# 2. Commit and push
git add releases/
git commit -m "Add release v${VERSION}"
git push

# 3. Create a GitHub release
git tag "v${VERSION}"
git push --tags

gh release create "v${VERSION}" \
  --title "Release v${VERSION}" \
  --notes "Release notes here" \
  "releases/v${VERSION}/rocket.jar"
```

#### Option 3: Using GitHub Web Interface

1. Create a new release from the GitHub web interface
2. Choose or create a new tag (e.g., `v1.0.0`)
3. Add release notes
4. Upload the fat-JAR file(s)
5. Publish the release

### Best Practices

1. **Version Naming**: Use semantic versioning (e.g., `v1.0.0`, `v2.1.3`)
2. **Release Notes**: Include:
   - What's new
   - Bug fixes
   - Breaking changes (if any)
   - Link to source repository commit/tag
3. **JAR Naming**: Use descriptive names like `rocket-v1.0.0.jar` or `rocket-game-1.0.0-all.jar`
4. **Testing**: Always test the JAR file before releasing:
   ```bash
   java -jar rocket-v1.0.0.jar --help
   ```

### Repository Structure

```
rocket-builds/
├── .github/
│   └── workflows/
│       ├── sync-releases.yml    # Automated sync from source repo
│       └── manual-release.yml   # Manual release creation
├── releases/                     # Optional: Store JAR files by version
│   ├── v1.0.0/
│   │   └── rocket-v1.0.0.jar
│   └── v1.0.1/
│       └── rocket-v1.0.1.jar
├── .gitignore
├── README.md
└── CONTRIBUTING.md              # This file
```

### Workflow Permissions

The workflows require:
- `contents: write` - To create releases and push commits
- `GITHUB_TOKEN` - Automatically provided by GitHub Actions

### Troubleshooting

**Release already exists**
- The sync workflow checks for existing releases and skips them
- To re-create a release, delete it first and re-run the workflow

**No JAR files found**
- Ensure the source repository publishes JAR files as release assets
- Check that the JAR files have the `.jar` extension

**Permission denied**
- Ensure the workflow has `contents: write` permission
- Check that the `GITHUB_TOKEN` has appropriate permissions

## For Users

To download and use the fat-JAR files, see the main [README.md](README.md).

## Questions or Issues

For questions about:
- **This distribution repository**: Open an issue here
- **The rocket application itself**: Open an issue in the [rocket repository](https://github.com/leakim78/rocket)
