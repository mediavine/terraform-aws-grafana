{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "Visualize Postgres metrics",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 707,
  "graphTooltip": 0,
  "id": 228,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "fillOpacity": 80,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineWidth": 1,
            "scaleDistribution": {
              "type": "linear"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 24,
      "options": {
        "barRadius": 0,
        "barWidth": 0.97,
        "fullHighlight": false,
        "groupWidth": 0.7,
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "orientation": "auto",
        "showValue": "auto",
        "stacking": "none",
        "tooltip": {
          "maxHeight": 600,
          "mode": "single",
          "sort": "none"
        },
        "xTickLabelRotation": 0,
        "xTickLabelSpacing": 0
      },
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT * FROM pg_stat_database;",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "Memory Usage",
      "type": "barchart"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 20,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT sum(blks_hit)*100/sum(blks_hit+blks_read) AS hit_ratio FROM pg_stat_database;\n",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "Cache Hit Ratio",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "description": "Info about background processes",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 8
      },
      "id": 23,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "maxHeight": 600,
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT * FROM pg_stat_bgwriter;",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "Background Processes",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "description": "Connections that are used, reserved for superuser, and max number of connections.",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 8
      },
      "id": 19,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "sizing": "auto"
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT  * FROM\n(SELECT count(*) used from pg_stat_activity) q1,\n(SELECT setting::int reserved_for_superuser from pg_settings where name=$$superuser_reserved_connections$$) q2,\n(SELECT setting::int max_conn from pg_settings where name=$$max_connections$$) q3;",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "DB Connections - Used, Reserved, and Max",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "description": "",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "custom": {
            "align": "auto",
            "cellOptions": {
              "type": "auto"
            },
            "inspect": false
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 16
      },
      "id": 25,
      "options": {
        "cellHeight": "sm",
        "footer": {
          "countRows": false,
          "fields": "",
          "reducer": [
            "sum"
          ],
          "show": false
        },
        "showHeader": true
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT pid, now() - pg_stat_activity.query_start AS duration, query\nFROM pg_stat_activity\nWHERE (now() - pg_stat_activity.query_start) > interval '10 minutes';",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "Long Running Queries",
      "type": "table"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "custom": {
            "align": "auto",
            "cellOptions": {
              "type": "auto"
            },
            "inspect": false
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 16
      },
      "id": 21,
      "options": {
        "cellHeight": "sm",
        "footer": {
          "countRows": false,
          "fields": "",
          "reducer": [
            "sum"
          ],
          "show": false
        },
        "showHeader": true
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "editorMode": "code",
          "format": "table",
          "rawQuery": true,
          "rawSql": "SELECT datname as db_name, pg_size_pretty(pg_database_size(datname)) as db_usage FROM pg_database;",
          "refId": "A",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          }
        }
      ],
      "title": "DB Size",
      "type": "table"
    },
    {
      "datasource": {
        "type": "grafana-postgresql-datasource",
        "uid": "${datasource}"
      },
      "description": "Idle and Active Connections",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "custom": {
            "align": "auto",
            "cellOptions": {
              "type": "auto"
            },
            "inspect": false
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "datname"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 46
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 7,
        "w": 22,
        "x": 1,
        "y": 24
      },
      "id": 18,
      "options": {
        "cellHeight": "sm",
        "footer": {
          "countRows": false,
          "fields": "",
          "reducer": [
            "sum"
          ],
          "show": false
        },
        "showHeader": true,
        "sortBy": []
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "dimensions": {
            "DBInstanceIdentifier": "$dbinstanceidentifier"
          },
          "editorMode": "code",
          "expression": "",
          "format": "table",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "label": "",
          "matchExact": true,
          "metricEditorMode": 0,
          "metricName": "DatabaseConnections",
          "metricQueryType": 0,
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "rawQuery": true,
          "rawSql": "SELECT * FROM pg_stat_activity WHERE state = 'active';\nSELECT * FROM pg_stat_activity WHERE state = 'idle';",
          "refId": "A",
          "region": "$region",
          "sql": {
            "columns": [
              {
                "parameters": [],
                "type": "function"
              }
            ],
            "groupBy": [
              {
                "property": {
                  "type": "string"
                },
                "type": "groupBy"
              }
            ],
            "limit": 50
          },
          "statistic": "Maximum"
        },
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "datasource": {
            "type": "grafana-postgresql-datasource",
            "uid": "${datasource}"
          },
          "dimensions": {
            "DBInstanceIdentifier": "$dbinstanceidentifier"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "label": "",
          "matchExact": true,
          "metricEditorMode": 0,
          "metricName": "DiskQueueDepth",
          "metricQueryType": 0,
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
          "region": "$region",
          "statistic": "Average"
        }
      ],
      "title": "DB Connections - Idle and Active",
      "type": "table"
    },
    {
      "datasource": {
        "type": "postgres",
        "uid": "${postgres_data_source_name}"
      },
      "editable": true,
      "error": false,
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 31
      },
      "id": 2,
      "options": {
        "code": {
          "language": "plaintext",
          "showLineNumbers": false,
          "showMiniMap": false
        },
        "content": "<a href=\"http://www.monitoringartist.com\" target=\"_blank\" title=\"Dashboard maintained by Monitoring Artist - DevOps / Docker / Kubernetes / AWS ECS / Google GCP / Zabbix / Zenoss / Terraform / Monitoring\"><img src=\"https://monitoringartist.github.io/monitoring-artist-logo-grafana.png\" height=\"30px\" /></a> | \n<a target=\"_blank\" href=\"https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch\">AWS CloudWatch RDS documentation</a> | \n<a target=\"_blank\" href=\"https://grafana.com/grafana/dashboards/707-aws-rds/\">Installed from Grafana.com dashboards</a>",
        "mode": "html"
      },
      "pluginVersion": "11.0.0",
      "targets": [
        {
          "datasource": {
            "type": "postgres",
            "uid": "${postgres_data_source_name}"
          },
          "refId": "A"
        }
      ],
      "title": "Documentation",
      "type": "text"
    }
  ],
  "schemaVersion": 39,
  "tags": [
    "monitoringartist",
    "postgres"
  ],
  "templating": {
    "list": [
      {
        "current": {},
        "hide": 0,
        "includeAll": false,
        "label": "Datasource",
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "${postgres_data_source_name}",
        "queryValue": "",
        "refresh": 1,
        "regex": "${datasource_regex}",
        "skipUrlSync": false,
        "type": "custom"
      },
      {
        "current": {},
        "hide": 0,
        "includeAll": false,
        "label": "Region",
        "multi": false,
        "name": "region",
        "options": [],
        "query": "${region_query_string}",
        "queryValue": "",
        "skipUrlSync": false,
        "type": "custom"
      },
      {
        "current": {
          "selected": false,
          "text": "${dbinstanceidentifier}",
          "value": "${dbinstanceidentifier}"
        },
        "datasource": {
          "type": "postgres",
          "uid": "${postgres_data_source_name}"
        },
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "label": "DBInstanceIdentifier",
        "multi": false,
        "name": "dbinstanceidentifier",
        "options": [],
        "query": "${dbinstanceidentifier}",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "custom",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "2024-06-17T18:15:05.402Z",
    "to": "2024-06-17T18:17:48.848Z"
  },
  "timeRangeUpdatedDuringEditOrView": false,
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Postgres Health DASHBOARD - ${postgres_data_source_name}",
  "uid": "${dashboard_uid}",
  "version": 45,
  "weekStart": ""
}
