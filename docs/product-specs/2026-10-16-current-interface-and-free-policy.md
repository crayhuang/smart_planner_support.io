# Feature spec: current interface and Free policy

Status: Verified locally; publication tracked in Git history
Last updated: 2026-10-16

## User problem

Visitors see an invented older interface and cannot find the current free AI
allowance. The website must match the app's current screens and subscription rules.

## Scope and plan

1. Replace the English and Chinese homepage mockup with native sample screenshots.
2. Show Assistant / Plan / Mine, voice review, date/time controls, Apple list
   selection, and both themes in light and dark appearances.
3. Explain Free and Pro on both homepages and help pages.
4. Synchronize the existing calendar-preference iCloud disclosure in both policies.
5. Verify the six pages at mobile, tablet and desktop widths, then publish this
   repository through its existing main-branch workflow.

No iOS source, subscription logic, prices, hosting configuration or App Store
metadata changes are part of this website update.

## Behavior and acceptance criteria

- [x] Free: 3 AI parses per calendar month, resetting on the first.
- [x] App updates preserve usage; at 3 or more used parses, remaining is 0.
- [x] Pro Monthly, Yearly and Lifetime all have unlimited parsing.
- [x] Visitors are directed to the app for actual prices and available plans.
- [x] Current app screenshots use only fictional schedules, in both languages.
- [x] Images preserve aspect ratio, reserve dimensions and lazy-load below hero.
- [x] Download, language switch, privacy, support and subscription links work.
- [x] iOS / iPadOS 17.0 minimum is stated.
- [x] Navigation remains available on phones; reduced motion and keyboard focus
      styles are supported.

## Source of truth

SmartArrangement: `SubscriptionTier.swift`, `V2RootTabView.swift`,
`docs/product/subscription/FREE_TIER_CURRENT_POLICY.md`, the current user guides,
local privacy-policy preference-sync disclosure and 2026-10-15 native screenshots.

## Privacy and localization

No analytics, external font requests, user data collection or new permissions.
Screenshot fixtures contain no personal schedules. Policy copy now includes
hashed calendar matching keys and preference revisions used by optional Pro
iCloud sync, consistent with the app's existing disclosure. Hashing does not
make these preferences anonymous. English and Chinese copy are equivalent.

## Verification evidence

- PASS: Chrome/Playwright, 6 pages × 320 / 390 / 768 / 1440 CSS-pixel widths.
- PASS: no document horizontal overflow, all images decoded, every image has an
  alt attribute, one h1 per page, no page JavaScript errors.
- PASS: local page links and same-page/cross-page fragment destinations.
- PASS: quota present on both home and support pages; retired quota copy absent.
- PASS: manual screenshot review of Chinese desktop hero and English mobile page.
- PASS: SmartArrangement `scripts/ai-native/verify-fast.sh` (existing app workspace).
- Native permissions, StoreKit purchase and AI execution were not exercised;
  this change updates website presentation only.

## Publication

The repository's configured GitHub Pages source is `main:/`. A separately hosted
Nginx copy, if in use, must run `scripts/server-update.sh` after this commit is
pushed. This task has no SSH server address or site directory configured.
