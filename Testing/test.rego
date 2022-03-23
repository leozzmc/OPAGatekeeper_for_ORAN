package kubernetes.test_admission   

import data.kubernetes.admission       

test_image_safety {                         
  unsafe_image := {             
    "request": {
      "kind": {"kind": "Pod"},
      "object": {
        "spec": {
          "containers": [
            {"image": "hooli.com/nginx"},
            {"image": "busybox"}
          ]
        }
      }
    }
  }
  expected := "image 'busybox' comes from untrusted registry"
  admission.deny[expected] with input as unsafe_image 
}