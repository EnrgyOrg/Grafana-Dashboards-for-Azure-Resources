
#Connect Azure and take storage information

#Azure AD App (Grafana) - Cert Connection 
Connect-AzAccount -ApplicationId "dded44b9-b4a2-483e-9759-9f500a97efb2" -Tenant "1a20d766-57ef-4f97-8226-00998d862d62" -CertificateThumbprint "5A6B74888DD2E98661F3CE00066ED0E7883F08E2"

$StorageAccounts=Get-AzStorageAccount

#File Management 
#$File = X
#Get-AzStorageAccount | Export-Csv "C:\GrafanaDashboards\$File.csv"
#$PathCSV = "C:\GrafanaDashboards\$File.csv"
#$PathJson = "C:\GrafanaDashboards\$File.json"
#$StorageAccounts = Import-Csv -Path $PathCSV

#Row Count
$Y = -4 
#Create Dashboard
foreach ($StorageAccount in $StorageAccounts) {
    $ResourceGroupName = $StorageAccount.ResourceGroupName
   $StorageAccountName = $StorageAccount.StorageAccountName
    $Y = $Y + 4
    
    $ID++
    $Panel1=
    '
    {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": null,
        "description": "'+$StorageAccountName+'",
        "fieldConfig": {
          "defaults": {
            "custom": {}
          },
          "overrides": []
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 4,
          "w": 4,
          "x": 0,
          "y": '+$Y+'
        },
        "hiddenSeries": false,
        "id": '+$ID+',
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "7.3.6",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "appInsights": {
              "dimension": [],
              "metricName": "select",
              "timeGrain": "auto"
            },
            "azureLogAnalytics": {
              "query": "",
              "resultFormat": "time_series",
              "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
            },
            "azureMonitor": {
              "aggOptions": [
                "Total"
              ],
              "aggregation": "Total",
              "allowedTimeGrainsMs": [
                60000,
                300000,
                900000,
                1800000,
                3600000,
                21600000,
                43200000,
                86400000
              ],
              "dimensionFilter": "*",
              "dimensionFilters": [],
              "dimensions": [
                {
                  "text": "Response type",
                  "value": "ResponseType"
                },
                {
                  "text": "Geo type",
                  "value": "GeoType"
                },
                {
                  "text": "API name",
                  "value": "ApiName"
                },
                {
                  "text": "Authentication",
                  "value": "Authentication"
                }
              ],
              "metricDefinition": "Microsoft.Storage/storageAccounts",
              "metricName": "Transactions",
              "metricNamespace": "Microsoft.Storage/storageAccounts",
              "resourceGroup": "'+$ResourceGroupName+'",
              "resourceName": "'+$StorageAccountName+'",
              "timeGrain": "auto",
              "timeGrains": [
                {
                  "text": "auto",
                  "value": "auto"
                },
                {
                  "text": "1 minute",
                  "value": "PT1M"
                },
                {
                  "text": "5 minutes",
                  "value": "PT5M"
                },
                {
                  "text": "15 minutes",
                  "value": "PT15M"
                },
                {
                  "text": "30 minutes",
                  "value": "PT30M"
                },
                {
                  "text": "1 hour",
                  "value": "PT1H"
                },
                {
                  "text": "6 hours",
                  "value": "PT6H"
                },
                {
                  "text": "12 hours",
                  "value": "PT12H"
                },
                {
                  "text": "1 day",
                  "value": "P1D"
                }
              ],
              "top": "10"
            },
            "insightsAnalytics": {
              "query": "",
              "resultFormat": "time_series"
            },
            "queryType": "Azure Monitor",
            "refId": "1",
            "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Storage Transactions",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
    '
    $ID++
    $Panel2=
    '
    {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": null,
        "description": "'+$StorageAccountName+'",
        "fieldConfig": {
          "defaults": {
            "custom": {}
          },
          "overrides": []
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 4,
          "w": 4,
          "x": 4,
          "y": '+$Y+'
        },
        "hiddenSeries": false,
        "id": '+$ID+',
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "7.3.6",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "appInsights": {
              "dimension": [],
              "metricName": "select",
              "timeGrain": "auto"
            },
            "azureLogAnalytics": {
              "query": "",
              "resultFormat": "time_series",
              "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
            },
            "azureMonitor": {
              "aggOptions": [
                "Average"
              ],
              "aggregation": "Average",
              "allowedTimeGrainsMs": [
                3600000
              ],
              "dimensionFilter": "*",
              "dimensionFilters": [],
              "dimensions": [],
              "metricDefinition": "Microsoft.Storage/storageAccounts",
              "metricName": "UsedCapacity",
              "metricNamespace": "Microsoft.Storage/storageAccounts",
              "resourceGroup": "'+$ResourceGroupName+'",
              "resourceName": "'+$StorageAccountName+'",
              "timeGrain": "auto",
              "timeGrains": [
                {
                  "text": "auto",
                  "value": "auto"
                },
                {
                  "text": "1 hour",
                  "value": "PT1H"
                }
              ],
              "top": "10"
            },
            "insightsAnalytics": {
              "query": "",
              "resultFormat": "time_series"
            },
            "queryType": "Azure Monitor",
            "refId": "A",
            "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Storage Usage",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "decbytes",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
    '
    $ID++
    $Panel3=
    '
    {
        "aliasColors": {},
        "bars": true,
        "dashLength": 10,
        "dashes": false,
        "datasource": null,
        "description": "'+$StorageAccountName+'",
        "fieldConfig": {
          "defaults": {
            "custom": {}
          },
          "overrides": []
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 4,
          "w": 4,
          "x": 8,
          "y": '+$Y+'
        },
        "hiddenSeries": false,
        "id": '+$ID+',
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": false,
        "linewidth": 8,
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "7.3.6",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "appInsights": {
              "dimension": [],
              "metricName": "select",
              "timeGrain": "auto"
            },
            "azureLogAnalytics": {
              "query": "",
              "resultFormat": "time_series",
              "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
            },
            "azureMonitor": {
              "aggOptions": [
                "Total",
                "Average",
                "Minimum",
                "Maximum"
              ],
              "aggregation": "Total",
              "allowedTimeGrainsMs": [
                60000,
                300000,
                900000,
                1800000,
                3600000,
                21600000,
                43200000,
                86400000
              ],
              "dimensionFilter": "*",
              "dimensionFilters": [],
              "dimensions": [
                {
                  "text": "Geo type",
                  "value": "GeoType"
                },
                {
                  "text": "API name",
                  "value": "ApiName"
                },
                {
                  "text": "Authentication",
                  "value": "Authentication"
                }
              ],
              "metricDefinition": "Microsoft.Storage/storageAccounts",
              "metricName": "Ingress",
              "metricNamespace": "Microsoft.Storage/storageAccounts",
              "resourceGroup": "'+$ResourceGroupName+'",
              "resourceName": "'+$StorageAccountName+'",
              "timeGrain": "auto",
              "timeGrains": [
                {
                  "text": "auto",
                  "value": "auto"
                },
                {
                  "text": "1 minute",
                  "value": "PT1M"
                },
                {
                  "text": "5 minutes",
                  "value": "PT5M"
                },
                {
                  "text": "15 minutes",
                  "value": "PT15M"
                },
                {
                  "text": "30 minutes",
                  "value": "PT30M"
                },
                {
                  "text": "1 hour",
                  "value": "PT1H"
                },
                {
                  "text": "6 hours",
                  "value": "PT6H"
                },
                {
                  "text": "12 hours",
                  "value": "PT12H"
                },
                {
                  "text": "1 day",
                  "value": "P1D"
                }
              ],
              "top": "10"
            },
            "insightsAnalytics": {
              "query": "",
              "resultFormat": "time_series"
            },
            "queryType": "Azure Monitor",
            "refId": "A",
            "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Storage Ingress",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "decbytes",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
    '
    $ID++
    $Panel4=
    '
    {
        "aliasColors": {},
        "bars": true,
        "dashLength": 10,
        "dashes": false,
        "datasource": null,
        "description": "'+$StorageAccountName+'",
        "fieldConfig": {
          "defaults": {
            "custom": {}
          },
          "overrides": []
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 4,
          "w": 4,
          "x": 12,
          "y": '+$Y+'
        },
        "hiddenSeries": false,
        "id": '+$ID+',
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": false,
        "linewidth": 1,
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "7.3.6",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "appInsights": {
              "dimension": [],
              "metricName": "select",
              "timeGrain": "auto"
            },
            "azureLogAnalytics": {
              "query": "",
              "resultFormat": "time_series",
              "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
            },
            "azureMonitor": {
              "aggOptions": [
                "Total",
                "Average",
                "Minimum",
                "Maximum"
              ],
              "aggregation": "Total",
              "allowedTimeGrainsMs": [
                60000,
                300000,
                900000,
                1800000,
                3600000,
                21600000,
                43200000,
                86400000
              ],
              "dimensionFilter": "*",
              "dimensionFilters": [],
              "dimensions": [
                {
                  "text": "Geo type",
                  "value": "GeoType"
                },
                {
                  "text": "API name",
                  "value": "ApiName"
                },
                {
                  "text": "Authentication",
                  "value": "Authentication"
                }
              ],
              "metricDefinition": "Microsoft.Storage/storageAccounts",
              "metricName": "Egress",
              "metricNamespace": "Microsoft.Storage/storageAccounts",
              "resourceGroup": "'+$ResourceGroupName+'",
              "resourceName": "'+$StorageAccountName+'",
              "timeGrain": "auto",
              "timeGrains": [
                {
                  "text": "auto",
                  "value": "auto"
                },
                {
                  "text": "1 minute",
                  "value": "PT1M"
                },
                {
                  "text": "5 minutes",
                  "value": "PT5M"
                },
                {
                  "text": "15 minutes",
                  "value": "PT15M"
                },
                {
                  "text": "30 minutes",
                  "value": "PT30M"
                },
                {
                  "text": "1 hour",
                  "value": "PT1H"
                },
                {
                  "text": "6 hours",
                  "value": "PT6H"
                },
                {
                  "text": "12 hours",
                  "value": "PT12H"
                },
                {
                  "text": "1 day",
                  "value": "P1D"
                }
              ],
              "top": "10"
            },
            "insightsAnalytics": {
              "query": "",
              "resultFormat": "time_series"
            },
            "queryType": "Azure Monitor",
            "refId": "A",
            "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Storage Egress",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "decbytes",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
    '
    $ID++
    $Panel5=
    '
    {
        "aliasColors": {},
        "bars": true,
        "dashLength": 10,
        "dashes": false,
        "datasource": null,
        "description": "'+$StorageAccountName+'",
        "fieldConfig": {
          "defaults": {
            "custom": {}
          },
          "overrides": []
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 4,
          "w": 4,
          "x": 16,
          "y": '+$Y+'
        },
        "hiddenSeries": false,
        "id": '+$ID+',
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": false,
        "linewidth": 1,
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "7.3.6",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "appInsights": {
              "dimension": [],
              "metricName": "select",
              "timeGrain": "auto"
            },
            "azureLogAnalytics": {
              "query": "",
              "resultFormat": "time_series",
              "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
            },
            "azureMonitor": {
              "aggOptions": [
                "Average",
                "Minimum",
                "Maximum"
              ],
              "aggregation": "Average",
              "allowedTimeGrainsMs": [
                60000,
                300000,
                900000,
                1800000,
                3600000,
                21600000,
                43200000,
                86400000
              ],
              "dimensionFilter": "*",
              "dimensionFilters": [],
              "dimensions": [
                {
                  "text": "Geo type",
                  "value": "GeoType"
                },
                {
                  "text": "API name",
                  "value": "ApiName"
                },
                {
                  "text": "Authentication",
                  "value": "Authentication"
                }
              ],
              "metricDefinition": "Microsoft.Storage/storageAccounts",
              "metricName": "SuccessServerLatency",
              "metricNamespace": "Microsoft.Storage/storageAccounts",
              "resourceGroup": "'+$ResourceGroupName+'",
              "resourceName": "'+$StorageAccountName+'",
              "timeGrain": "auto",
              "timeGrains": [
                {
                  "text": "auto",
                  "value": "auto"
                },
                {
                  "text": "1 minute",
                  "value": "PT1M"
                },
                {
                  "text": "5 minutes",
                  "value": "PT5M"
                },
                {
                  "text": "15 minutes",
                  "value": "PT15M"
                },
                {
                  "text": "30 minutes",
                  "value": "PT30M"
                },
                {
                  "text": "1 hour",
                  "value": "PT1H"
                },
                {
                  "text": "6 hours",
                  "value": "PT6H"
                },
                {
                  "text": "12 hours",
                  "value": "PT12H"
                },
                {
                  "text": "1 day",
                  "value": "P1D"
                }
              ],
              "top": "10"
            },
            "insightsAnalytics": {
              "query": "",
              "resultFormat": "time_series"
            },
            "queryType": "Azure Monitor",
            "refId": "A",
            "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Storage Lattency",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "ms",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
    '
    $ID++
    $Panel6=
    '
    {
    "aliasColors": {},
    "bars": true,
    "dashLength": 10,
    "dashes": false,
    "datasource": null,
    "description": "'+$StorageAccountName+'",
    "fieldConfig": {
      "defaults": {
        "custom": {}
      },
      "overrides": []
    },
    "fill": 1,
    "fillGradient": 0,
    "gridPos": {
      "h": 4,
      "w": 4,
      "x": 20,
      "y": '+$Y+'
    },
    "hiddenSeries": false,
    "id": '+$ID+',
    "legend": {
      "avg": false,
      "current": false,
      "max": false,
      "min": false,
      "show": true,
      "total": false,
      "values": false
    },
    "lines": false,
    "linewidth": 1,
    "nullPointMode": "null",
    "options": {
      "alertThreshold": true
    },
    "percentage": false,
    "pluginVersion": "7.3.6",
    "pointradius": 2,
    "points": false,
    "renderer": "flot",
    "seriesOverrides": [],
    "spaceLength": 10,
    "stack": false,
    "steppedLine": false,
    "targets": [
      {
        "appInsights": {
          "dimension": [],
          "metricName": "select",
          "timeGrain": "auto"
        },
        "azureLogAnalytics": {
          "query": "",
          "resultFormat": "time_series",
          "workspace": "ac997bb4-bd8e-4711-9003-ce5cc5629005"
        },
        "azureMonitor": {
          "aggOptions": [
            "Average",
            "Minimum",
            "Maximum"
          ],
          "aggregation": "Average",
          "allowedTimeGrainsMs": [
            60000,
            300000,
            900000,
            1800000,
            3600000,
            21600000,
            43200000,
            86400000
          ],
          "dimensionFilter": "*",
          "dimensionFilters": [],
          "dimensions": [
            {
              "text": "Geo type",
              "value": "GeoType"
            },
            {
              "text": "API name",
              "value": "ApiName"
            },
            {
              "text": "Authentication",
              "value": "Authentication"
            }
          ],
          "metricDefinition": "Microsoft.Storage/storageAccounts",
          "metricName": "Availability",
          "metricNamespace": "Microsoft.Storage/storageAccounts",
          "resourceGroup": "'+$ResourceGroupName+'",
          "resourceName": "'+$StorageAccountName+'",
          "timeGrain": "auto",
          "timeGrains": [
            {
              "text": "auto",
              "value": "auto"
            },
            {
              "text": "1 minute",
              "value": "PT1M"
            },
            {
              "text": "5 minutes",
              "value": "PT5M"
            },
            {
              "text": "15 minutes",
              "value": "PT15M"
            },
            {
              "text": "30 minutes",
              "value": "PT30M"
            },
            {
              "text": "1 hour",
              "value": "PT1H"
            },
            {
              "text": "6 hours",
              "value": "PT6H"
            },
            {
              "text": "12 hours",
              "value": "PT12H"
            },
            {
              "text": "1 day",
              "value": "P1D"
            }
          ],
          "top": "10"
        },
        "insightsAnalytics": {
          "query": "",
          "resultFormat": "time_series"
        },
        "queryType": "Azure Monitor",
        "refId": "A",
        "subscription": "17cddef3-ad09-447e-83ea-7fac1eb78ed8"
      }
    ],
    "thresholds": [],
    "timeFrom": null,
    "timeRegions": [],
    "timeShift": null,
    "title": "Storage Availability",
    "tooltip": {
      "shared": true,
      "sort": 0,
      "value_type": "individual"
    },
    "type": "graph",
    "xaxis": {
      "buckets": null,
      "mode": "time",
      "name": null,
      "show": true,
      "values": []
    },
    "yaxes": [
      {
        "format": "percent",
        "label": null,
        "logBase": 1,
        "max": null,
        "min": null,
        "show": true
      },
      {
        "format": "short",
        "label": null,
        "logBase": 1,
        "max": null,
        "min": null,
        "show": true
      }
    ],
    "yaxis": {
      "align": false,
      "alignLevel": null
    }
    },
    '

    $Line = $Panel1 + $Panel2 + $Panel3 + $Panel4 + $Panel5 + $Panel6

    $Grid = $Grid + $Line

}

$Begining =
'
{
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": "-- Grafana --",
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "type": "dashboard"
        }
      ]
    },
    "editable": true,
    "gnetId": null,
    "graphTooltip": 0,
    "id": null,
    "links": [],
    "panels": [

'

$Ending =
'
],
"schemaVersion": 26,
"style": "dark",
"tags": [],
"templating": {
  "list": []
},
"time": {
  "from": "now-6h",
  "to": "now"
},
"timepicker": {},
"timezone": "",
"title": "Storage",
"uid": "IFCLgv-Mz",
"version": 1
}
'
$Dashboard = $Begining + $Grid.Remove($Grid.Length - 7) + $Ending

#$Dashboard | Out-File -FilePath $PathJson


#Add Dashboard

$Body = '{"dashboard":'+$dashboard+', "folderId": 0, "overwrite": true }'

$Header = @{
'Content-Type' = 'application/json'
'Authorization' = 'Bearer eyJrIjoiMGhhRFZlaVVvZlg0YnhlSDc5YWpINFJ3MEtMRDZRbm8iLCJuIjoiUG93ZXJTaGVsbEF6dXJlRGFzaGJvYXJkVXBkYXRlIiwiaWQiOjF9'
}
$Uri = "http://10.232.1.11:3000/api/dashboards/db"

$Result = Invoke-RestMethod -Uri $Uri -Method 'Post' -Body $Body -Headers $Header

$Result