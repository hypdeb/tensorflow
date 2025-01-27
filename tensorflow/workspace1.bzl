"""TensorFlow workspace initialization. Consult the WORKSPACE on how to use it."""

load("//third_party/android:android_configure.bzl", "android_configure")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@io_bazel_rules_closure//closure:defs.bzl", "closure_repositories")
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

# buildifier: disable=unnamed-macro
def workspace(with_rules_cc = True):
    """Loads a set of TensorFlow dependencies. To be used in a WORKSPACE file.

    Args:
      with_rules_cc: Unused, to be removed soon.
    """
    rules_pkg_dependencies()

    closure_repositories()

    http_archive(
        name = "bazel_toolchains",
        sha256 = "294cdd859e57fcaf101d4301978c408c88683fbc46fbc1a3829da92afbea55fb",
        strip_prefix = "bazel-toolchains-8c717f8258cd5f6c7a45b97d974292755852b658",
        urls = [
            "http://mirror.tensorflow.org/github.com/bazelbuild/bazel-toolchains/archive/8c717f8258cd5f6c7a45b97d974292755852b658.tar.gz",
            "https://github.com/bazelbuild/bazel-toolchains/archive/8c717f8258cd5f6c7a45b97d974292755852b658.tar.gz",
        ],
    )

    android_configure(name = "local_config_android")

# Alias so it can be loaded without assigning to a different symbol to prevent
# shadowing previous loads and trigger a buildifier warning.
tf_workspace1 = workspace
