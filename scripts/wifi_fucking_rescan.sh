#!/bin/bash
nmcli device wifi rescan && echo "nmcli wifi rescan ok" || echo "nmcli wifi rescan error"
