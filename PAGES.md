# KaamSetu page reference

This document describes the current worker-facing pages, their visual treatment, and their navigation behavior. All pages use the shared blue KaamSetu theme, rounded controls, neutral grey background, consistent 8/16/24/32-point spacing, and Material 3 typography.

## 1. Splash

A full blue screen with a white circular tool icon, the KaamSetu name, and the line “Skills se kaam tak.” It automatically replaces itself with Login after a short delay, so it does not remain in the back stack.

## 2. Login

A centered, scrollable starting page with the KaamSetu tool mark, a worker-focused heading, an Indian mobile-number field, and a full-width Continue button. Inline validation accepts only ten digits beginning with 6–9. A small note explains that this is a local prototype and sends no SMS.

## 3. OTP verification

A standard app bar provides back navigation. The page repeats the selected phone number and displays a six-digit, obscured OTP input. The prototype accepts only `123456`. Successful verification removes the authentication stack and opens Registration.

## 4. Worker registration

A responsive form captures full name, primary construction trade, city/work area, and years of experience. Every field has consistent icons and validation. The same page can be reached from the Profile tab in edit mode without losing authenticated state.

## 5. Profile review

A centered avatar and name lead into a bordered summary card containing mobile number, trade, location, and experience. The primary action proceeds to Skill Selection; the back button returns to the registration form for corrections.

## 6. Skill selection

Selectable filter chips present common construction skills. Chips wrap automatically for narrow Android screens, while the action remains anchored below a scrollable content region. At least one skill is required.

## 7. Skill assessment

A compact assessment page shows progress, a safety scenario in a shared card, radio-button answers, and a Finish button. It generates a local prototype score and clears onboarding before opening Home.

## 8. Home and job recommendations

The Home tab greets the worker by first name and shows a search box plus local job cards. Search filters by job title, trade, or location. Every card clearly presents employer, match percentage, daily pay, distance, and location. Selecting a card opens Job Details.

## 9. Job details

This page has a back-enabled app bar, a job summary card, description, required-skill chips, and a full-width Apply action placed in the safe bottom area. Applying once creates an in-memory application and replaces this detail page with Application Status, preventing duplicate submission.

## 10. Applications

The Applications bottom tab shows a reusable empty state before the first submission. Submitted jobs appear as tappable cards with employer, location, and current status. Selecting one opens the corresponding Application Status page.

## 11. Application status

A green confirmation icon and status summary make submission state immediately clear. A card repeats the job and employer and shows “Under review.” Back navigation returns to the prior authenticated screen.

## 12. Notifications

The Notifications bottom tab shows local welcome and application updates. Unread items are emphasized with stronger type and a tinted icon background. Tapping a notification marks it as read. An empty-state component is ready for a cleared list.

## 13. Profile

The Profile bottom tab shows identity, trade, phone, location, experience, assessment score, and skill chips. Edit Profile reuses the registration form. Log out clears the authenticated navigation stack and returns to Login.

## 14. Unknown route

Invalid route names and invalid typed route arguments render a friendly Page Not Found state instead of throwing an exception. Its action clears the bad navigation stack and returns to Login.

## Shared navigation

Home, Applications, Notifications, and Profile live in an `IndexedStack`, which preserves each tab’s UI state and avoids pushing a new route on every tab selection. On Android back, a non-Home tab returns to Home; detail pages use normal route back behavior.
