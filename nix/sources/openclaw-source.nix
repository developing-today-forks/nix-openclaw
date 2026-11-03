# Pinned OpenClaw source for nix-openclaw
{
  owner = "openclaw";
  repo = "openclaw";
  pnpmMajor = "12";
  applyPublicSurfaceHardlinksPatch = false;
  applySkipPluginAutoEnableNixModePatch = false;
  applyNixStorePluginOwnershipPatch = true;
  applySessionsSpawnHeadlessPatch = true;
  releaseTag = "v2026.10.7";
  releaseVersion = "2026.10.7";
  runtimePluginVersion = "2026.10.7";
  rev = "157d8c2bc3ea2fa183afdc11088e69690bf8e64e";
  hash = "sha256-J/jIhSX0fRmUw0cv/2i2YXUOBw4yimIndp9LO6ueq2U=";
  gatewayNpmDepsHash = "sha256-KqTqPh2B+o8q/W+uCPH8cL/p8Pyyx0f1MoZNuYBkCwk=";
  # Source-build pnpm deps hash for the pinned rev (derived 2026-11-03
  # from the fixed-output mismatch when the sessions_spawn patch first
  # forced the source build, developing-today/code#2257).
  pnpmDepsHash = "sha256-XlBV+o+/TodBc2OGJck+H1Al/coOYgm84TFTtd4l4u8=";
}
