# build2 Package for doctest

This project is a [build2](https://build2.org) package repository that provides access to [`doctest`](https://github.com/doctest/doctest), a C++ testing framework that brings the ability to have tests written directly in the production code thanks to a fast, transparent and flexible test runner with a clean interface.

[![Official](https://img.shields.io/website/https/github.com/doctest/doctest.svg?down_message=offline&label=Official&style=for-the-badge&up_color=blue&up_message=online)](https://github.com/doctest/doctest)
[![build2](https://img.shields.io/website/https/github.com/build2-packaging/doctest.svg?down_message=offline&label=build2&style=for-the-badge&up_color=blue&up_message=online)](https://github.com/build2-packaging/doctest)
[![cppget.org](https://img.shields.io/website/https/cppget.org/doctest.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online)](https://cppget.org/doctest)
[![queue.cppget.org](https://img.shields.io/website/https/queue.cppget.org/doctest.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running)](https://queue.cppget.org/doctest)

## Usage
Make sure to add the stable or testing section of the [`cppget.org`](https://cppget.org/?about) repository to your project's `repositories.manifest` to be able to fetch this package.

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

If the stable or testing section of `cppget.org` is not an option then add this Git repository itself instead as a prerequisite.

    :
    role: prerequisite
    location: https://github.com/build2-packaging/doctest.git

Add the respective dependency in your project's `manifest` file to make the package available for import.

    depends: doctest ^2.4.12

To import the library target that already implements the `main` function, include the following declaration in a `buildfile`.

    import doctest = doctest%lib{doctest-main}

If you want to customize the testing process by providing your own `main`, use the following header-only library target instead.

    import doctest = doctest%lib{doctest}


## Configuration
`doctest` itself already comes with various configuration options.
Some of these can be accessed by the package configuration.
For an explanation, refer to `doctest`'s configuration documentation.
The following variables need to be provided globally and will affect both library targets, `lib{doctest}` and `lib{doctest-main}`.

    config [bool] config.doctest.disable                 ?= false
    config [bool] config.doctest.treat_char_as_string    ?= false
    config [bool] config.doctest.use_std_headers         ?= false
    config [bool] config.doctest.no_exceptions           ?= false
    config [bool] config.doctest.no_contradicting_inline ?= false

The following configuration variables only need to be set for the implementation unit and will only affect the `lib{doctest-main}` library target.
Define their respective pre-processor macros for doctest implementation unit that implement their own `main` function and only link to `lib{doctest}`.

    config [string] config.doctest.options_prefix      ?= [null]
    config [bool] config.doctest.no_unprefixed_options ?= false
    config [bool] config.doctest.colors_none           ?= false
    config [bool] config.doctest.colors_windows        ?= false
    config [bool] config.doctest.colors_ansi           ?= false
    config [bool] config.doctest.windows_seh           ?= false
    config [bool] config.doctest.no_windows_seh        ?= false
    config [bool] config.doctest.posix_signals         ?= false
    config [bool] config.doctest.no_posix_signals      ?= false
    config [bool] config.doctest.no_multithreading     ?= false
    config [bool] config.doctest.no_multi_lane_atomics ?= false

- Some configuration options cannot be provided by the package. Use them only in your `doctest` implementation file when linking against `lib{doctest}` for providing your own `main` function.
    - `DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN`
    - `DOCTEST_CONFIG_IMPLEMENT`
    - `DOCTEST_CONFIG_IMPLEMENTATION_IN_DLL`
- Some configuration options do not need to be defined globally. You may also define them only for specific source files when they are actually needed. As of such, no global package configuration variables are provided for these options. Instead, define their respective pre-processor macros in the required units to enable them.
    - `DOCTEST_CONFIG_NO_SHORT_MACRO_NAMES`
    - `DOCTEST_CONFIG_REQUIRE_STRINGIFICATION_FOR_ALL_USED_TYPES`
    - `DOCTEST_CONFIG_DOUBLE_STRINGIFY`
    - `DOCTEST_CONFIG_SUPER_FAST_ASSERTS`
    - `DOCTEST_CONFIG_VOID_CAST_EXPRESSIONS`
    - `DOCTEST_CONFIG_NO_COMPARISON_WARNING_SUPPRESSION`
    - `DOCTEST_CONFIG_NO_TRY_CATCH_IN_ASSERTS`
    - `DOCTEST_CONFIG_NO_EXCEPTIONS_BUT_WITH_ALL_ASSERTS`
    - `DOCTEST_CONFIG_ASSERTION_PARAMETERS_BY_VALUE`
    - `DOCTEST_CONFIG_INCLUDE_TYPE_TRAITS`
    - `DOCTEST_CONFIG_ASSERTS_RETURN_VALUES`
    - `DOCTEST_CONFIG_EVALUATE_ASSERTS_EVEN_WHEN_DISABLED`
    - `DOCTEST_CONFIG_NO_INCLUDE_IOSTREAM`
    - `DOCTEST_CONFIG_HANDLE_EXCEPTION`

## Issues and Notes
- The tests fail for MinGW on Windows as different line numbers for assertions in the file `asserts_used_outside_of_tests.cpp` are generated and compared to expected line numbers in `asserts_used_outside_of_tests.cpp.txt`. This issue is not caused by the build system and must be fixed upstream. Fortunately, it is not a major problem and the package can be used without concerns on all available platforms.
- According to the upstream build system, `lib{doctest-main}` does not need to export `pthread` for multi-threading. Also, basic unit tests run perfectly fine. As of that, `pthread` is neither exported by `lib{doctest}` nor by `lib{doctest-main}`. However, in feature tests, `pthread` is used to test concurrency. Consequently, be aware of linking `pthread` when needed.
- The `bitfield_packed_struct.cpp` file uses the `WIN32` macro to determine whether the code is compiled with MSVC on Windows. However, the official macro is `_WIN32`. Therefore the code has been adjusted and the original is now stored as `bitfield_packed_struct.cpp.orig`.

## Contributing
Thank you in advance for your help and contribution to keep this package up-to-date.
Please, file an issue on [GitHub](https://github.com/build2-packaging/doctest/issues) for questions, bug reports, or to recommend updating the package version.
If you're making a pull request to fix bugs or update the package version yourself, refer to the [`build2` Packaging Guidelines](https://build2.org/build2-toolchain/doc/build2-toolchain-packaging.xhtml#core-version-management).
