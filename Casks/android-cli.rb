# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cask "android-cli" do
  version :latest
  sha256 :no_check

  on_macos do
    depends_on arch: :arm64
    depends_on macos: ">= :monterey"
    url "https://dl.google.com/android/cli/latest/darwin_arm64/android",
        verified: "dl.google.com"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://dl.google.com/android/cli/latest/linux_x86_64/android",
        verified: "dl.google.com"
  end

  name "Android CLI"
  desc "Android Developer command-line tools"
  homepage "https://developer.android.com/tools/agents/android-cli"

  binary "android"

  postflight do
    system_command "#{staged_path}/android",
                   env: { "ANDROID_CLI_FRESH_INSTALL" => "1" }
  end
end
