PACMAN(8)                            Pacman Manual                           PACMAN(8)

NNAAMMEE
       pacman - package manager utility

SSYYNNOOPPSSIISS
       _p_a_c_m_a_n <operation> [options] [targets]

DDEESSCCRRIIPPTTIIOONN
       Pacman is a package management utility that tracks installed packages on a
       Linux system. It features dependency support, package groups, install and
       uninstall scripts, and the ability to sync your local machine with a remote
       repository to automatically upgrade packages. Pacman packages are a zipped tar
       format.

       Since version 3.0.0, pacman has been the front-end to lliibbaallppmm(3), the “Arch
       Linux Package Management” library. This library allows alternative front-ends
       to be written (for instance, a GUI front-end).

       Invoking pacman involves specifying an operation with any potential options and
       targets to operate on. A _t_a_r_g_e_t is usually a package name, file name, URL, or a
       search string. Targets can be provided as command line arguments. Additionally,
       if stdin is not from a terminal and a single hyphen (-) is passed as an
       argument, targets will be read from stdin.

OOPPEERRAATTIIOONNSS
       --DD,, ----ddaattaabbaassee
           Operate on the package database. This operation allows you to modify
           certain attributes of the installed packages in pacman’s database. It also
           allows you to check the databases for internal consistency. See Database
           Options below.

       --QQ,, ----qquueerryy
           Query the package database. This operation allows you to view installed
           packages and their files, as well as meta-information about individual
           packages (dependencies, conflicts, install date, build date, size). This
           can be run against the local package database or can be used on individual
           package files. In the first case, if no package names are provided in the
           command line, all installed packages will be queried. Additionally, various
           filters can be applied on the package list. See Query Options below.

       --RR,, ----rreemmoovvee
           Remove package(s) from the system. Groups can also be specified to be
           removed, in which case every package in that group will be removed. Files
           belonging to the specified package will be deleted, and the database will
           be updated. Most configuration files will be saved with a _._p_a_c_s_a_v_e
           extension unless the _-_-_n_o_s_a_v_e option is used. See Remove Options below.

       --SS,, ----ssyynncc
           Synchronize packages. Packages are installed directly from the remote
           repositories, including all dependencies required to run the packages. For
           example, pacman -S qt will download and install qt and all the packages it
           depends on. If a package name exists in more than one repository, the
           repository can be explicitly specified to clarify the package to install:
           pacman -S testing/qt. You can also specify version requirements: pacman -S
           "bash>=3.2". Quotes are needed, otherwise the shell interprets ">" as
           redirection to a file.

           In addition to packages, groups can be specified as well. For example, if
           gnome is a defined package group, then pacman -S gnome will provide a
           prompt allowing you to select which packages to install from a numbered
           list. The package selection is specified using a space- and/or
           comma-separated list of package numbers. Sequential packages may be
           selected by specifying the first and last package numbers separated by a
           hyphen (-). Excluding packages is achieved by prefixing a number or range
           of numbers with a caret (^).

           Packages that provide other packages are also handled. For example, pacman
           -S foo will first look for a foo package. If foo is not found, packages
           that provide the same functionality as foo will be searched for. If any
           package is found, it will be installed. A selection prompt is provided if
           multiple packages providing foo are found.

           You can also use pacman -Su to upgrade all packages that are out-of-date.
           See Sync Options below. When upgrading, pacman performs version comparison
           to determine which packages need upgrading. This behavior operates as
           follows:

               Alphanumeric:
                 1.0a < 1.0b < 1.0beta < 1.0p < 1.0pre < 1.0rc < 1.0 < 1.0.a < 1.0.1
               Numeric:
                 1 < 1.0 < 1.1 < 1.1.1 < 1.2 < 2.0 < 3.0.0

           Additionally, version strings can have an _e_p_o_c_h value defined that will
           overrule any version comparison, unless the epoch values are equal. This is
           specified in an epoch:version-rel format. For example, 2:1.0-1 is always
           greater than 1:3.6-1.

       --TT,, ----ddeepptteesstt
           Check dependencies; this is useful in scripts such as makepkg to check
           installed packages. This operation will check each dependency specified and
           return a list of dependencies that are not currently satisfied on the
           system. This operation accepts no other options. Example usage: pacman -T
           qt "bash>=3.2".

       --UU,, ----uuppggrraaddee
           Upgrade or add package(s) to the system and install the required
           dependencies from sync repositories. Either a URL or file path can be
           specified. This is a “remove-then-add” process. See Upgrade Options below;
           also see Handling Config Files for an explanation on how pacman takes care
           of configuration files.

       --FF,, ----ffiilleess
           Query the files database. This operation allows you to look for packages
           owning certain files or display files owned by certain packages. Only
           packages that are part of your sync databases are searched. See File
           Options below.

       --VV,, ----vveerrssiioonn
           Display version and exit.

       --hh,, ----hheellpp
           Display syntax for the given operation. If no operation was supplied, then
           the general syntax is shown.

OOPPTTIIOONNSS
       --bb,, ----ddbbppaatthh <path>
           Specify an alternative database location (a typical default is
           /var/lib/pacman). This should not be used unless you know what you are
           doing.  NNOOTTEE: If specified, this is an absolute path, and the root path is
           not automatically prepended.

       --rr,, ----rroooott <path>
           Specify an alternative installation root (default is /). This should not be
           used as a way to install software into /usr/local instead of /usr. This
           option is used if you want to install a package on a temporarily mounted
           partition that is "owned" by another system.  NNOOTTEE: If database path or log
           file are not specified on either the command line or in ppaaccmmaann..ccoonnff(5),
           their default location will be inside this root path.

       --vv,, ----vveerrbboossee
           Output paths such as as the Root, Conf File, DB Path, Cache Dirs, etc.

       ----aarrcchh <arch>
           Specify an alternate architecture.

       ----ccaacchheeddiirr <dir>
           Specify an alternative package cache location (a typical default is
           /var/cache/pacman/pkg). Multiple cache directories can be specified, and
           they are tried in the order they are passed to pacman.  NNOOTTEE: This is an
           absolute path, and the root path is not automatically prepended.

       ----ccoolloorr <when>
           Specify when to enable coloring. Valid options are _a_l_w_a_y_s, _n_e_v_e_r, or _a_u_t_o.
           _a_l_w_a_y_s forces colors on; _n_e_v_e_r forces colors off; and _a_u_t_o only
           automatically enables colors when outputting onto a tty.

       ----ccoonnffiigg <file>
           Specify an alternate configuration file.

       ----ddeebbuugg
           Display debug messages. When reporting bugs, this option is recommended to
           be used.

       ----ggppggddiirr <dir>
           Specify a directory of files used by GnuPG to verify package signatures (a
           typical default is /etc/pacman.d/gnupg). This directory should contain two
           files: pubring.gpg and trustdb.gpg.  pubring.gpg holds the public keys of
           all packagers.  trustdb.gpg contains a so-called trust database, which
           specifies that the keys are authentic and trusted.  NNOOTTEE: This is an
           absolute path, and the root path is not automatically prepended.

       ----hhooookkddiirr <dir>
           Specify a alternative directory containing hook files (a typical default is
           /etc/pacman.d/hooks). Multiple hook directories can be specified with hooks
           in later directories taking precedence over hooks in earlier directories.
           NNOOTTEE: This is an absolute path, and the root path is not automatically
           prepended.

       ----llooggffiillee <file>
           Specify an alternate log file. This is an absolute path, regardless of the
           installation root setting.

       ----nnooccoonnffiirrmm
           Bypass any and all “Are you sure?” messages. It’s not a good idea to do
           this unless you want to run pacman from a script.

       ----ccoonnffiirrmm
           Cancels the effects of a previous _-_-_n_o_c_o_n_f_i_r_m.

TTRRAANNSSAACCTTIIOONN OOPPTTIIOONNSS ((AAPPPPLLYY TTOO --SS,, --RR AANNDD --UU))
       --dd,, ----nnooddeeppss
           Skips dependency version checks. Package names are still checked. Normally,
           pacman will always check a package’s dependency fields to ensure that all
           dependencies are installed and there are no package conflicts in the
           system. Specify this option twice to skip all dependency checks.

       ----aassssuummee--iinnssttaalllleedd <package=version>
           Add a virtual package "package" with version "version" to the transaction
           to satisfy dependencies. This allows to disable specific dependency checks
           without affecting all dependency checks. To disable all dependency
           checking, see the _-_-_n_o_d_e_p_s option.

       ----ddbboonnllyy
           Adds/removes the database entry only, leaving all files in place.

       ----nnoopprrooggrreessssbbaarr
           Do not show a progress bar when downloading files. This can be useful for
           scripts that call pacman and capture the output.

       ----nnoossccrriippttlleett
           If an install scriptlet exists, do not execute it. Do not use this unless
           you know what you are doing.

       --pp,, ----pprriinntt
           Only print the targets instead of performing the actual operation (sync,
           remove or upgrade). Use _-_-_p_r_i_n_t_-_f_o_r_m_a_t to specify how targets are
           displayed. The default format string is "%l", which displays URLs with _-_S,
           file names with _-_U, and pkgname-pkgver with _-_R.

       ----pprriinntt--ffoorrmmaatt <format>
           Specify a printf-like format to control the output of the _-_-_p_r_i_n_t
           operation. The possible attributes are: "%n" for pkgname, "%v" for pkgver,
           "%l" for location, "%r" for repository, and "%s" for size. Implies _-_-_p_r_i_n_t.

UUPPGGRRAADDEE OOPPTTIIOONNSS ((AAPPPPLLYY TTOO --SS AANNDD --UU))
       ----ffoorrccee
           Bypass file conflict checks and overwrite conflicting files. If the package
           that is about to be installed contains files that are already installed,
           this option will cause all those files to be overwritten. Using _-_-_f_o_r_c_e
           will not allow overwriting a directory with a file or installing packages
           with conflicting files and directories. This option should be used with
           care, ideally not at all.

       ----aassddeeppss
           Install packages non-explicitly; in other words, fake their install reason
           to be installed as a dependency. This is useful for makepkg and other
           build-from-source tools that need to install dependencies before building
           the package.

       ----aasseexxpplliicciitt
           Install packages explicitly; in other words, fake their install reason to
           be explicitly installed. This is useful if you want to mark a dependency as
           explicitly installed so it will not be removed by the _-_-_r_e_c_u_r_s_i_v_e remove
           operation.

       ----iiggnnoorree <package>
           Directs pacman to ignore upgrades of package even if there is one
           available. Multiple packages can be specified by separating them with a
           comma.

       ----iiggnnoorreeggrroouupp <group>
           Directs pacman to ignore upgrades of all packages in _g_r_o_u_p, even if there
           is one available. Multiple groups can be specified by separating them with
           a comma.

       ----nneeeeddeedd
           Do not reinstall the targets that are already up-to-date.

QQUUEERRYY OOPPTTIIOONNSS
       --cc,, ----cchhaannggeelloogg
           View the ChangeLog of a package if it exists.

       --dd,, ----ddeeppss
           Restrict or filter output to packages installed as dependencies. This
           option can be combined with _-_t for listing real orphans - packages that
           were installed as dependencies but are no longer required by any installed
           package.

       --ee,, ----eexxpplliicciitt
           Restrict or filter output to explicitly installed packages. This option can
           be combined with _-_t to list explicitly installed packages that are not
           required by any other package.

       --gg,, ----ggrroouuppss
           Display all packages that are members of a named group. If a name is not
           specified, list all grouped packages.

       --ii,, ----iinnffoo
           Display information on a given package. The _-_p option can be used if
           querying a package file instead of the local database. Passing two _-_-_i_n_f_o
           or _-_i flags will also display the list of backup files and their
           modification states.

       --kk ----cchheecckk
           Check that all files owned by the given package(s) are present on the
           system. If packages are not specified or filter flags are not provided,
           check all installed packages. Specifying this option twice will perform
           more detailed file checking (including permissions, file sizes, and
           modification times) for packages that contain the needed mtree file.

       --ll,, ----lliisstt
           List all files owned by a given package. Multiple packages can be specified
           on the command line.

       --mm,, ----ffoorreeiiggnn
           Restrict or filter output to packages that were not found in the sync
           database(s). Typically these are packages that were downloaded manually and
           installed with _-_-_u_p_g_r_a_d_e.

       --nn,, ----nnaattiivvee
           Restrict or filter output to packages that are found in the sync
           database(s). This is the inverse filter of _-_-_f_o_r_e_i_g_n.

       --oo,, ----oowwnnss <file>
           Search for packages that own the specified file(s). The path can be
           relative or absolute, and one or more files can be specified.

       --pp,, ----ffiillee
           Signifies that the package supplied on the command line is a file and not
           an entry in the database. The file will be decompressed and queried. This
           is useful in combination with _-_-_i_n_f_o and _-_-_l_i_s_t.

       --qq,, ----qquuiieett
           Show less information for certain query operations. This is useful when
           pacman’s output is processed in a script. Search will only show package
           names and not version, group, and description information; owns will only
           show package names instead of "file is owned by pkg" messages; group will
           only show package names and omit group names; list will only show files and
           omit package names; check will only show pairs of package names and missing
           files; a bare query will only show package names rather than names and
           versions.

       --ss,, ----sseeaarrcchh <regexp>
           Search each locally-installed package for names or descriptions that match
           regexp. When including multiple search terms, only packages with
           descriptions matching ALL of those terms are returned.

       --tt,, ----uunnrreeqquuiirreedd
           Restrict or filter output to packages not required or optionally required
           by any currently installed package. Specify this option twice to only
           filter packages that are direct dependencies (i.e. do not filter optional
           dependencies).

       --uu,, ----uuppggrraaddeess
           Restrict or filter output to packages that are out-of-date on the local
           system. Only package versions are used to find outdated packages;
           replacements are not checked here. This option works best if the sync
           database is refreshed using _-_S_y.

RREEMMOOVVEE OOPPTTIIOONNSS
       --cc,, ----ccaassccaaddee
           Remove all target packages, as well as all packages that depend on one or
           more target packages. This operation is recursive and must be used with
           care, since it can remove many potentially needed packages.

       --nn,, ----nnoossaavvee
           Instructs pacman to ignore file backup designations. Normally, when a file
           is removed from the system, the database is checked to see if the file
           should be renamed with a _._p_a_c_s_a_v_e extension.

       --ss,, ----rreeccuurrssiivvee
           Remove each target specified including all of their dependencies, provided
           that (A) they are not required by other packages; and (B) they were not
           explicitly installed by the user. This operation is recursive and analogous
           to a backwards _-_-_s_y_n_c operation, and it helps keep a clean system without
           orphans. If you want to omit condition (B), pass this option twice.

       --uu,, ----uunnnneeeeddeedd
           Removes targets that are not required by any other packages. This is mostly
           useful when removing a group without using the _-_c option, to avoid breaking
           any dependencies.

SSYYNNCC OOPPTTIIOONNSS
       --cc,, ----cclleeaann
           Remove packages that are no longer installed from the cache as well as
           currently unused sync databases to free up disk space. When pacman
           downloads packages, it saves them in a cache directory. In addition,
           databases are saved for every sync DB you download from and are not deleted
           even if they are removed from the configuration file ppaaccmmaann..ccoonnff(5). Use
           one _-_-_c_l_e_a_n switch to only remove packages that are no longer installed;
           use two to remove all files from the cache. In both cases, you will have a
           yes or no option to remove packages and/or unused downloaded databases.

           If you use a network shared cache, see the _C_l_e_a_n_M_e_t_h_o_d option in
           ppaaccmmaann..ccoonnff(5).

       --gg,, ----ggrroouuppss
           Display all the members for each package group specified. If no group names
           are provided, all groups will be listed; pass the flag twice to view all
           groups and their members.

       --ii,, ----iinnffoo
           Display information on a given sync database package. Passing two _-_-_i_n_f_o or
           _-_i flags will also display those packages in all repositories that depend
           on this package.

       --ll,, ----lliisstt
           List all packages in the specified repositories. Multiple repositories can
           be specified on the command line.

       --qq,, ----qquuiieett
           Show less information for certain sync operations. This is useful when
           pacman’s output is processed in a script. Search will only show package
           names and not repository, version, group, and description information; list
           will only show package names and omit databases and versions; group will
           only show package names and omit group names.

       --ss,, ----sseeaarrcchh <regexp>
           This will search each package in the sync databases for names or
           descriptions that match regexp. When you include multiple search terms,
           only packages with descriptions matching ALL of those terms will be
           returned.

       --uu,, ----ssyyssuuppggrraaddee
           Upgrades all packages that are out-of-date. Each currently-installed
           package will be examined and upgraded if a newer package exists. A report
           of all packages to upgrade will be presented, and the operation will not
           proceed without user confirmation. Dependencies are automatically resolved
           at this level and will be installed/upgraded if necessary.

           Pass this option twice to enable package downgrades; in this case, pacman
           will select sync packages whose versions do not match with the local
           versions. This can be useful when the user switches from a testing
           repository to a stable one.

           Additional targets can also be specified manually, so that _-_S_u _f_o_o will do
           a system upgrade and install/upgrade the "foo" package in the same
           operation.

       --ww,, ----ddoowwnnllooaaddoonnllyy
           Retrieve all packages from the server, but do not install/upgrade anything.

       --yy,, ----rreeffrreesshh
           Download a fresh copy of the master package database from the server(s)
           defined in ppaaccmmaann..ccoonnff(5). This should typically be used each time you use
           _-_-_s_y_s_u_p_g_r_a_d_e or _-_u. Passing two _-_-_r_e_f_r_e_s_h or _-_y flags will force a refresh
           of all package databases, even if they appear to be up-to-date.

DDAATTAABBAASSEE OOPPTTIIOONNSS
       ----aassddeeppss <package>
           Mark a package as non-explicitly installed; in other words, set their
           install reason to be installed as a dependency.

       ----aasseexxpplliicciitt <package>
           Mark a package as explicitly installed; in other words, set their install
           reason to be explicitly installed. This is useful it you want to keep a
           package installed even when it was initially installed as a dependency of
           another package.

       --kk ----cchheecckk
           Check the local package database is internally consistent. This will check
           all required files are present and that installed packages have the
           required dependencies, do not conflict and that multiple packages do not
           own the same file. Specifying this option twice will perform a check on the
           sync databases to ensure all specified dependencies are available.

FFIILLEE OOPPTTIIOONNSS
       --yy,, ----rreeffrreesshh
           Download fresh package databases from the server. Use twice to force a
           refresh even if databases are up to date.

       --ll,, ----lliisstt
           List the files owned by the queried package.

       --ss,, ----sseeaarrcchh
           Search package file names for matching strings.

       --xx,, ----rreeggeexx
           Treat arguments to _-_-_s_e_a_r_c_h as regular expressions.

       --oo,, ----oowwnnss
           Search for packages that own a particular file.

       --qq,, ----qquuiieett
           Show less information for certain file operations. This is useful when
           pacman’s output is processed in a script, however, you may want to use
           _-_-_m_a_c_h_i_n_e_r_e_a_d_a_b_l_e instead.

       ----mmaacchhiinneerreeaaddaabbllee
           Use a machine readable output format for _-_-_l_i_s_t, _-_-_s_e_a_r_c_h and _-_-_o_w_n_s. The
           format is _r_e_p_o_s_i_t_o_r_y_\_0_p_k_g_n_a_m_e_\_0_p_k_g_v_e_r_\_0_p_a_t_h_\_n with _\_0 being the NULL
           character and _\_n a linefeed.

HHAANNDDLLIINNGG CCOONNFFIIGG FFIILLEESS
       Pacman uses the same logic as _r_p_m to determine action against files that are
       designated to be backed up. During an upgrade, three MD5 hashes are used for
       each backup file to determine the required action: one for the original file
       installed, one for the new file that is about to be installed, and one for the
       actual file existing on the file system. After comparing these three hashes,
       the follow scenarios can result:

       original=X, current=X, new=X
           All three files are the same, so overwrites are not an issue. Install the
           new file.

       original=X, current=X, new=Y
           The current file is the same as the original, but the new one differs.
           Since the user did not ever modify the file, and the new one may contain
           improvements or bug fixes, install the new file.

       original=X, current=Y, new=X
           Both package versions contain the exact same file, but the one on the file
           system has been modified. Leave the current file in place.

       original=X, current=Y, new=Y
           The new file is identical to the current file. Install the new file.

       original=X, current=Y, new=Z
           All three files are different, so install the new file with a _._p_a_c_n_e_w
           extension and warn the user. The user must then manually merge any
           necessary changes into the original file.

       original=NULL, current=Y, new=Z
           The package was not previously installed, and the file already exists on
           the file system. Install the new file with a _._p_a_c_n_e_w extension and warn the
           user. The user must then manually merge any necessary changes into the
           original file.

EEXXAAMMPPLLEESS
       pacman -Ss ne.hack
           Search for regexp "ne.hack" in package database.

       pacman -S gpm
           Download and install gpm including dependencies.

       pacman -U /home/user/ceofhack-0.6-1-x86_64.pkg.tar.gz
           Install ceofhack-0.6-1 package from a local file.

       pacman -Syu
           Update package list and upgrade all packages afterwards.

       pacman -Syu gpm
           Update package list, upgrade all packages, and then install gpm if it
           wasn’t already installed.

CCOONNFFIIGGUURRAATTIIOONN
       See ppaaccmmaann..ccoonnff(5) for more details on configuring pacman using the _p_a_c_m_a_n_._c_o_n_f
       file.

SSEEEE AALLSSOO
       aallppmm--hhooookkss(5), lliibbaallppmm(3), mmaakkeeppkkgg(8), ppaaccmmaann..ccoonnff(5)

       See the pacman website at https://www.archlinux.org/pacman/ for current
       information on pacman and its related tools.

BBUUGGSS
       Bugs? You must be kidding; there are no bugs in this software. But if we happen
       to be wrong, send us an email with as much detail as possible to
       pacman-dev@archlinux.org.

AAUUTTHHOORRSS
       Current maintainers:

       ·   Allan McRae <allan@archlinux.org>

       ·   Andrew Gregory <andrew.gregory.8@gmail.com>

       ·   Dan McGee <dan@archlinux.org>

       ·   Dave Reisner <dreisner@archlinux.org>

       Past major contributors:

       ·   Judd Vinet <jvinet@zeroflux.org>

       ·   Aurelien Foret <aurelien@archlinux.org>

       ·   Aaron Griffin <aaron@archlinux.org>

       ·   Xavier Chantry <shiningxc@gmail.com>

       ·   Nagy Gabor <ngaba@bibl.u-szeged.hu>

       For additional contributors, use git shortlog -s on the pacman.git repository.

Pacman 5.0.2                          2017-06-03                             PACMAN(8)
