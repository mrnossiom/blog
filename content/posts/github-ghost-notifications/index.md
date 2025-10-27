+++
title = "How to clear GitHub ghost notifications?"
date = "2025-11-04"
updated = "2025-11-04"

[extra]
skills = []

summary = """
Once in a while, I get metionned by a spam account. Those spam issues get removed quickly but they also glitch out the notification feed leaving a blue badge on top of your notification tray forever.

Really forever? No, because you can suppress the notification thread (how GitHub refers to such items in their documentation) via the API.
"""
+++

Once in a while, I get metionned on GitHub by a spam account. Those spam messages often get removed quickly but they also glitch out the notification tray, leaving a blue badge on top of your notification tray forever.

Really forever? No, because you can suppress the notification thread (how GitHub refers to such items in their documentation) via the API.

<!-- more -->

You can find the offending repository by looking at your [notifications dashboard].

[notifications dashboard]: https://github.com/notifications

- Grab the correct notification thread id among all your notifications.

  If you know the offending `$REPOSITORY`

  ```sh
  gh api -X GET /notifications --field all=true \
      --jq ".[] | select(.repository.full_name == \"$REPOSITORY\") | .id"
  ```

  If you have no idea where does it come from you can still explore all your notifications to find the offender.

  ```sh
  gh api -X GET /notifications --field all=true
  ```

- Use the `$THREAD_ID` retrieved in a `DELETE` request to the right endpoint

  ```sh
  gh api -X DELETE /notifications/threads/$THREAD_ID
  ```

You can substitute `gh api` calls with `curl` invocations to `https://api.github.com` and a personal access token.

Checkout the [GitHub reference](gh-ref) around notifications.

[gh-ref]: https://docs.github.com/en/rest/activity/notifications?apiVersion=2022-11-28
