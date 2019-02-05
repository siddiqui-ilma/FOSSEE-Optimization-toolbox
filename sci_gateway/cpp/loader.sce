// This file is released under the 3-clause BSD license. See COPYING-BSD.
// Generated by builder.sce : Please, do not edit this file
// ----------------------------------------------------------------------------
//
libFOSSEE_Optimizat_path = get_absolute_file_path('loader.sce');
//
// ulink previous function with same name
[bOK, ilib] = c_link('libFOSSEE_Optimization_Toolbox');
if bOK then
  ulink(ilib);
end
//
list_functions = [ 'linearprog';
];
addinter(libFOSSEE_Optimizat_path + filesep() + 'libFOSSEE_Optimization_Toolbox' + getdynlibext(), 'libFOSSEE_Optimization_Toolbox', list_functions);
// remove temp. variables on stack
clear libFOSSEE_Optimizat_path;
clear bOK;
clear ilib;
clear list_functions;
// ----------------------------------------------------------------------------
