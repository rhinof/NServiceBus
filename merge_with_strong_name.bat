xcopy build build\merge /Q /Y
xcopy external-bin build\merge /Q /Y
external-bin\ilmerge /keyfile:NServiceBus.snk /log:build\output.txt /target:library /xmldocs /out:NServiceBus.dll build\merge\NServiceBus.dll build\merge\antlr.runtime.dll build\merge\Castle.Core.dll build\merge\Castle.DynamicProxy2.dll build\merge\Castle.MicroKernel.dll build\merge\Castle.Windsor.dll build\merge\Common.Logging.dll build\merge\Common.Logging.Log4Net.dll build\merge\Spring.Core.dll build\merge\Spring.Aop.dll build\merge\NServiceBus.Config.dll build\merge\Interop.MSMQ.dll build\merge\
echo NServiceBus.dll merged
move NServiceBus.dll external-bin
move NServiceBus.pdb external-bin
move NServiceBus.xml external-bin
del build\merge\*.* /Q