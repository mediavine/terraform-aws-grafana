{
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": {
            "type": "grafana",
            "uid": "-- Grafana --"
          },
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "type": "dashboard"
        }
      ]
    },
    "editable": true,
    "fiscalYearStartMonth": 0,
    "graphTooltip": 0,
    "id": 199,
    "links": [],
    "liveNow": false,
    "panels": [
      {
        "datasource": {
          "type": "mixed",
          "uid": "-- Mixed --"
        },
        "gridPos": {
          "h": 3,
          "w": 24,
          "x": 0,
          "y": 0
        },
        "id": 1,
        "options": {
          "code": {
            "language": "plaintext",
            "showLineNumbers": false,
            "showMiniMap": false
          },
          "content": "#                       ECS FARGATE HEALTH DASHBOARD",
          "mode": "markdown"
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {},
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": true,
            "metricEditorMode": 0,
            "metricName": "",
            "metricQueryType": 0,
            "namespace": "",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "type": "text"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "description": "Average CPU utilization by cluster.",
        "fieldConfig": {
          "defaults": {
            "mappings": [],
            "thresholds": {
              "mode": "percentage",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "orange",
                  "value": 70
                },
                {
                  "color": "red",
                  "value": 85
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 0,
          "y": 3
        },
        "id": 2,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "max"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "ClusterName": "$cluster"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "CPUUtilization",
            "metricQueryType": 0,
            "namespace": "AWS/ECS",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "title": "CPU Utilization Average",
        "transformations": [
          {
            "id": "calculateField",
            "options": {
              "mode": "reduceRow",
              "reduce": {
                "reducer": "mean"
              },
              "replaceFields": true
            }
          }
        ],
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "description": "Average memory utilization by cluster.",
        "fieldConfig": {
          "defaults": {
            "mappings": [],
            "thresholds": {
              "mode": "percentage",
              "steps": [
                {
                  "color": "green",
                  "value": null
                },
                {
                  "color": "orange",
                  "value": 70
                },
                {
                  "color": "red",
                  "value": 85
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 6,
          "y": 3
        },
        "id": 3,
        "options": {
          "minVizHeight": 75,
          "minVizWidth": 75,
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "max"
            ],
            "fields": "",
            "values": false
          },
          "showThresholdLabels": false,
          "showThresholdMarkers": true
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "ClusterName": "$cluster"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "MemoryUtilization",
            "metricQueryType": 0,
            "namespace": "AWS/ECS",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "title": "Memory Utilization Average",
        "transformations": [
          {
            "id": "calculateField",
            "options": {
              "mode": "reduceRow",
              "reduce": {
                "reducer": "mean"
              },
              "replaceFields": true
            }
          }
        ],
        "type": "gauge"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "description": "Running tasks for all services. This number may have a deviation of around 5",
        "fieldConfig": {
          "defaults": {
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
                  "value": 400
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 12,
          "y": 3
        },
        "id": 4,
        "options": {
          "colorMode": "background",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "mean"
            ],
            "fields": "/^Running Tasks$/",
            "values": false
          },
          "text": {},
          "textMode": "value_and_name",
          "wideLayout": false
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "ClusterName": "$cluster",
              "ServiceName": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "RunningTaskCount",
            "metricQueryType": 0,
            "namespace": "ECS/ContainerInsights",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Maximum"
          }
        ],
        "transformations": [
          {
            "id": "calculateField",
            "options": {
              "alias": "Running Tasks",
              "binary": {
                "left": "ADT-1500-GppTCFCheck-c",
                "operator": "+"
              },
              "mode": "reduceRow",
              "reduce": {
                "include": [],
                "reducer": "sum"
              },
              "replaceFields": false
            }
          }
        ],
        "type": "stat"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "description": "Number of unhealthy targets (did not pass health check)",
        "fieldConfig": {
          "defaults": {
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
                  "value": 1
                }
              ]
            },
            "unit": "short"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 18,
          "y": 3
        },
        "id": 5,
        "options": {
          "colorMode": "background",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "auto",
          "reduceOptions": {
            "calcs": [
              "max"
            ],
            "fields": "/^Unhealthy Host Count$/",
            "values": false
          },
          "textMode": "value_and_name",
          "wideLayout": false
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "UnHealthyHostCount",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Maximum"
          }
        ],
        "transformations": [
          {
            "id": "calculateField",
            "options": {
              "alias": "Unhealthy Host Count",
              "mode": "reduceRow",
              "reduce": {
                "reducer": "sum"
              },
              "replaceFields": true
            }
          }
        ],
        "type": "stat"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "gridPos": {
          "h": 2,
          "w": 24,
          "x": 0,
          "y": 7
        },
        "id": 11,
        "options": {
          "code": {
            "language": "plaintext",
            "showLineNumbers": false,
            "showMiniMap": false
          },
          "content": "## Service & Task Level Metrics\n\n",
          "mode": "markdown"
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {},
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": true,
            "metricEditorMode": 0,
            "metricName": "",
            "metricQueryType": 0,
            "namespace": "",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "type": "text"
      },
      {
        "datasource": {
          "type": "cloudwatch",
          "uid": "${datasource}"
        },
        "description": "",
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
                }
              ]
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 14,
          "w": 12,
          "x": 0,
          "y": 9
        },
        "id": 6,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "RequestCountPerTarget",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "SampleCount"
          }
        ],
        "title": "Request Count Per Target",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "cloudwatch",
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
            },
            "unit": "ms"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 12,
          "y": 9
        },
        "id": 7,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "TargetResponseTime",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Maximum"
          }
        ],
        "title": "Target Response Time",
        "transformations": [],
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "cloudwatch",
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
          "h": 7,
          "w": 12,
          "x": 12,
          "y": 16
        },
        "id": 8,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "id": "",
            "label": "5xx",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "HTTPCode_Target_5XX_Count",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Sum"
          },
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "hide": false,
            "id": "",
            "label": "4xx",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "HTTPCode_Target_4XX_Count",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "B",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Sum"
          },
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "LoadBalancer": "*"
            },
            "expression": "",
            "hide": false,
            "id": "",
            "label": "3xx",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "HTTPCode_Target_3XX_Count",
            "metricQueryType": 0,
            "namespace": "AWS/ApplicationELB",
            "period": "",
            "queryMode": "Metrics",
            "refId": "C",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Sum"
          }
        ],
        "title": "Status Code Count (3xx/4xx/5xx)",
        "transformations": [],
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "cloudwatch",
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
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 0,
          "y": 23
        },
        "id": 9,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "ClusterName": "$cluster",
              "ServiceName": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "CPUUtilization",
            "metricQueryType": 0,
            "namespace": "AWS/ECS",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "title": "CPU Utilization Average by Service",
        "transformations": [],
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "cloudwatch",
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
            },
            "unit": "percent"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": 12,
          "y": 23
        },
        "id": 10,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "10.2.2",
        "targets": [
          {
            "datasource": {
              "type": "cloudwatch",
              "uid": "${datasource}"
            },
            "dimensions": {
              "ClusterName": "$cluster",
              "ServiceName": "*"
            },
            "expression": "",
            "id": "",
            "label": "",
            "logGroups": [],
            "matchExact": false,
            "metricEditorMode": 0,
            "metricName": "MemoryUtilization",
            "metricQueryType": 0,
            "namespace": "AWS/ECS",
            "period": "",
            "queryMode": "Metrics",
            "refId": "A",
            "region": "$region",
            "sqlExpression": "",
            "statistic": "Average"
          }
        ],
        "title": "Memory Utilization Average by Service",
        "transformations": [],
        "type": "timeseries"
      }
    ],
    "refresh": "",
    "schemaVersion": 38,
    "tags": [],
    "templating": {
      "list": [
        {
          "current": {},
          "hide": 0,
          "includeAll": false,
          "label": "Cluster",
          "multi": false,
          "name": "cluster",
          "options": [],
          "query": "${cluster_query_string}",
          "queryValue": "",
          "skipUrlSync": false,
          "type": "custom"
        },
        {
          "current": {},
          "hide": 2,
          "includeAll": false,
          "label": "Data Source ",
          "multi": false,
          "name": "datasource",
          "options": [],
          "query": "cloudwatch",
          "refresh": 1,
          "regex": "${datasource_regex}",
          "skipUrlSync": false,
          "type": "datasource"
        },
        {
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
        }
      ]
    },
    "time": {
      "from": "now-1h",
      "to": "now"
    },
    "timepicker": {},
    "timezone": "",
    "title": "ECS FARGATE HEALTH DASHBOARD - ${cloudwatch_data_source_name}",
    "uid": "${dashboard_uid}",
    "version": 1,
    "weekStart": ""
  }