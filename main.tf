resource "dynatrace_json_dashboard_base" "dashboard-a" {
}

resource "dynatrace_json_dashboard" "dashboard-a" {
  contents = jsonencode({
      "dashboardMetadata": {
        "name": "dashboard-a",
        "owner": "me@home.com"
      },
      "tiles": [
        {
          "bounds": {
            "height": 152,
            "left": 0,
            "top": 0,
            "width": 304
          },
          "configured": true,
          "markdown": "## This is a reference to [Dashboard B](https://#########.live.dynatrace.com/#dashboard;gtf=-2h;gf=all;id=${dynatrace_json_dashboard_base.dashboard-b.id})",
          "name": "Markdown",
          "tileType": "MARKDOWN"
        }
      ]
    })
}

resource "dynatrace_json_dashboard_base" "dashboard-b" {
}

resource "dynatrace_json_dashboard" "dashboard-b" {
  contents = jsonencode({
      "dashboardMetadata": {
        "name": "dashboard-b",
        "owner": "me@home.com"
      },
      "tiles": [
        {
          "bounds": {
            "height": 152,
            "left": 0,
            "top": 0,
            "width": 304
          },
          "configured": true,
          "markdown": "## This is a reference to [Dashboard A](https://#########.live.dynatrace.com/#dashboard;gtf=-2h;gf=all;id=${dynatrace_json_dashboard_base.dashboard-a.id})",
          "name": "Markdown",
          "tileType": "MARKDOWN"
        }
      ]
    }) 
}