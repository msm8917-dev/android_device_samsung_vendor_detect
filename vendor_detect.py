import os
blacklist = ["qcom", "nxp","pixel-framework", "lawnchair"  ,"support", "overlay","samsung", "gapps", "google", "gms", "codeaurora", "addons", "overlays", "xtras", "themes"]
vendors = os.listdir("vendor")
for vendor in vendors:
  common = "vendor/"+vendor+"/config/common.mk"
  if os.path.isfile(common) and vendor not in blacklist:
     print(vendor)
     break

