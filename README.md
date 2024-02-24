<h1 align="center">
    build2 Package for doctest
</h1>

<p align="center">
    This project builds and defines the build2 package for <a href="https://github.com/doctest/doctest">doctest</a>.
    doctest is a new C++ testing framework but is by far the fastest both in compile times and runtime compared to other feature-rich alternatives. It brings the ability to have tests written directly in the production code thanks to a fast, transparent and flexible test runner with a clean interface.
</p>

<p align="center">
    <a href="https://github.com/doctest/doctest">
        <img src="https://img.shields.io/website/https/github.com/doctest/doctest.svg?down_message=offline&label=Official&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://github.com/build2-packaging/doctest">
        <img src="https://img.shields.io/website/https/github.com/build2-packaging/doctest.svg?down_message=offline&label=build2&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://cppget.org/doctest">
        <img src="https://img.shields.io/website/https/cppget.org/doctest.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://queue.cppget.org/doctest">
        <img src="https://img.shields.io/website/https/queue.cppget.org/doctest.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running">
    </a>
</p>

## Usage
Make sure to add the stable `cppget.org` repositories to your project's `repositories.manifest` to be able to fetch the packages.

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

Add the respective dependency in your project's `manifest` file to make the package available for import.

    depends: doctest ^ 2.4.10

The header-only C++ library to use doctest as your unit testing framework can be imported by the following declaration in a `buildfile`.

    import doctest = doctest%lib{doctest}

    import doctest = doctest%lib{doctest-main}

## Configuration

    # doctest's configuration variables that either must be set globally.
    #
    config [bool] config.doctest.disable                 ?= false
    config [bool] config.doctest.treat_char_as_string    ?= false
    config [bool] config.doctest.use_std_headers         ?= false
    config [bool] config.doctest.no_exceptions           ?= false
    config [bool] config.doctest.no_contradicting_inline ?= false

    # doctest's configuration variables that must only be set for the implementation.
    #
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

## Issues and Notes
- `DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN`
- `DOCTEST_CONFIG_IMPLEMENT`
- `DOCTEST_CONFIG_IMPLEMENTATION_IN_DLL`
- specific source file definitions
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

## Contributing
Thanks in advance for your help and contribution to keep this package up-to-date.
For now, please, file an issue on [GitHub](https://github.com/build2-packaging/doctest/issues) for everything that is not described below.

### Recommend Updating Version
Please, file an issue on [GitHub](https://github.com/build2-packaging/doctest/issues) with the new recommended version.

### Update Version by Pull Request
1. Fork the repository on [GitHub](https://github.com/build2-packaging/doctest) and clone it to your local machine.
2. Run `git submodule init` and `git submodule update` to get the current upstream directory.
3. Inside the `upstream` directory, checkout the new library version `X.Y.Z` by calling `git checkout vX.Y.Z` that you want to be packaged.
4. If needed, change source files, `buildfiles`, and symbolic links accordingly to create a working build2 package. Make sure not to directly depend on the upstream directory inside the build system but use symbolic links instead.
5. Update library version in `manifest` file if it has changed or add package update by using `+n` for the `n`-th update.
6. Make an appropriate commit message by using imperative mood and a capital letter at the start and push the new commit to the `master` branch.
7. Run `bdep ci` and test for errors.
8. If everything works fine, make a pull request on GitHub and write down the `bdep ci` link to your CI tests.
9. After a successful pull request, we will run the appropriate commands to publish a new package version.

### Update Version Directly if You Have Permissions
1. Inside the `upstream` directory, checkout the new library version `X.Y.Z` by calling `git checkout vX.Y.Z` that you want to be packaged.
2. If needed, change source files, `buildfiles`, and symbolic links accordingly to create a working build2 package. Make sure not to directly depend on the upstream directory inside the build system but use symbolic links instead.
3. Update library version in `manifest` file if it has changed or add package update by using `+n` for the `n`-th update.
4. Make an appropriate commit message by using imperative mood and a capital letter at the start and push the new commit to the `master` branch.
5. Run `bdep ci` and test for errors and warnings.
6. When successful, run `bdep release --tag --push` to push new tag version to repository.
7. Run `bdep publish` to publish the package to [cppget.org](https://cppget.org).
