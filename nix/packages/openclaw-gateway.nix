{
  callPackage,
  sourceInfo,
  gatewaySrc ? null,
  pnpmDepsHash ? (sourceInfo.pnpmDepsHash or null),
  pnpm_11 ? callPackage ./pnpm-11.nix { },
  pnpm_12 ? callPackage ./pnpm-12.nix { },
  bundledAcpx ? null,
  ...
}:

let
  # Carried source patches (e.g. the sessions_spawn headless patch,
  # developing-today/code#2257) are applied by gateway-postpatch.sh in
  # the SOURCE build only. The npm package path ships the prebuilt
  # upstream dist and never runs the postpatch, so when the pinned
  # source opts into a carried patch the npm path must not be
  # selected — otherwise the build silently ships an unpatched
  # gateway (verified on the #2257 host build: fork pin da8a763
  # resolved through the npm path and the patch never applied).
  carriesSourcePatch = sourceInfo.applySessionsSpawnHeadlessPatch or false;
  useNpmPackage =
    gatewaySrc == null && sourceInfo ? gatewayNpmDepsHash && bundledAcpx != null && !carriesSourcePatch;
in
if useNpmPackage then
  callPackage ./openclaw-gateway-npm.nix {
    inherit sourceInfo bundledAcpx;
  }
else
  callPackage ./openclaw-gateway-source.nix {
    inherit
      sourceInfo
      gatewaySrc
      bundledAcpx
      pnpmDepsHash
      pnpm_11
      pnpm_12
      ;
  }
