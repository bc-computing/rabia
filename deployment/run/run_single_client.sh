: <<'END'
    Copyright 2021 Rabia Research Team and Developers

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
END
run_single_client() {
  # build Rabia binary
  build_binary
  # load Rabia extra profiles and variables
  load_variables
  if [ $? -ne 0 ]; then # if there's an error
    return 1            # early exit
  fi

  idx=$1
  find_proxy_idx ${idx}
  proxy_idx=$?

  RC_Role=cli RC_Index=${idx} RC_Proxy=${RC_Proxies[$proxy_idx]} ${RCFolder}/rabia
}

source ../profile/profile0.sh # required, load the variables and functions
run_single_client $1