
SWIFT_DOCKER_IMAGE=swift:5.1
LAMBDA_ZIP=lambda.zip
LAMBDA_NAME=Config
EXECUTABLE=lambda
SHARED_LIBS_FOLDER=swift-shared-libs
LAYER_ZIP=swift-lambda-runtime.zip
SHARED_LIBS_FOLDER=swift-shared-libs
LAYER_ZIP=swift-lambda-runtime.zip

clean_lambda:
	rm $(LAMBDA_ZIP) || true
	rm -rf .build || true

build_lambda:
	docker run \
			--rm \
			--volume "$(shell pwd)/:/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			swift build

package_lambda: clean_lambda build_lambda
	zip -r -j $(LAMBDA_ZIP) .build/debug/$(EXECUTABLE)

deploy_lambda: package_layer package_lambda 
	cd ../config-stack && cdk deploy

clean_layer:
	rm upload/$(LAYER_ZIP) || true
	rm -r $(SHARED_LIBS_FOLDER) || true

package_layer: clean_layer
	mkdir -p $(SHARED_LIBS_FOLDER)/lib
	docker run \
			--rm \
			--volume "$(shell pwd)/:/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			cp /lib64/ld-linux-x86-64.so.2 $(SHARED_LIBS_FOLDER)
	docker run \
			--rm \
			--volume "$(shell pwd)/:/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			cp -t $(SHARED_LIBS_FOLDER)/lib \
					/lib/x86_64-linux-gnu/libc.so.6 \
					/lib/x86_64-linux-gnu/libcom_err.so.2 \
					/lib/x86_64-linux-gnu/libcrypt.so.1 \
					/lib/x86_64-linux-gnu/libdl.so.2 \
					/lib/x86_64-linux-gnu/libgcc_s.so.1 \
					/lib/x86_64-linux-gnu/libkeyutils.so.1 \
					/lib/x86_64-linux-gnu/libm.so.6 \
					/lib/x86_64-linux-gnu/libpthread.so.0 \
					/lib/x86_64-linux-gnu/libresolv.so.2 \
					/lib/x86_64-linux-gnu/librt.so.1 \
					/lib/x86_64-linux-gnu/libutil.so.1 \
					/lib/x86_64-linux-gnu/libz.so.1 \
					/usr/lib/swift/linux/libBlocksRuntime.so \
					/usr/lib/swift/linux/libFoundation.so \
					/usr/lib/swift/linux/libFoundationNetworking.so \
					/usr/lib/swift/linux/libdispatch.so \
					/usr/lib/swift/linux/libicudataswift.so.61 \
					/usr/lib/swift/linux/libicui18nswift.so.61 \
					/usr/lib/swift/linux/libicuucswift.so.61 \
					/usr/lib/swift/linux/libswiftCore.so \
					/usr/lib/swift/linux/libswiftDispatch.so \
					/usr/lib/swift/linux/libswiftGlibc.so \
					/usr/lib/swift/linux/libswiftSwiftOnoneSupport.so \
					/usr/lib/x86_64-linux-gnu/libasn1.so.8 \
					/usr/lib/x86_64-linux-gnu/libatomic.so.1 \
					/usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 \
					/usr/lib/x86_64-linux-gnu/libcurl.so.4 \
					/usr/lib/x86_64-linux-gnu/libffi.so.6 \
					/usr/lib/x86_64-linux-gnu/libgmp.so.10 \
					/usr/lib/x86_64-linux-gnu/libgnutls.so.30 \
					/usr/lib/x86_64-linux-gnu/libgssapi.so.3 \
					/usr/lib/x86_64-linux-gnu/libgssapi_krb5.so.2 \
					/usr/lib/x86_64-linux-gnu/libhcrypto.so.4 \
					/usr/lib/x86_64-linux-gnu/libheimbase.so.1 \
					/usr/lib/x86_64-linux-gnu/libheimntlm.so.0 \
					/usr/lib/x86_64-linux-gnu/libhogweed.so.4 \
					/usr/lib/x86_64-linux-gnu/libhx509.so.5 \
					/usr/lib/x86_64-linux-gnu/libidn2.so.0 \
					/usr/lib/x86_64-linux-gnu/libk5crypto.so.3 \
					/usr/lib/x86_64-linux-gnu/libkrb5.so.26 \
					/usr/lib/x86_64-linux-gnu/libkrb5.so.3 \
					/usr/lib/x86_64-linux-gnu/libkrb5support.so.0 \
					/usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 \
					/usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 \
					/usr/lib/x86_64-linux-gnu/libnettle.so.6 \
					/usr/lib/x86_64-linux-gnu/libnghttp2.so.14 \
					/usr/lib/x86_64-linux-gnu/libp11-kit.so.0 \
					/usr/lib/x86_64-linux-gnu/libpsl.so.5 \
					/usr/lib/x86_64-linux-gnu/libroken.so.18 \
					/usr/lib/x86_64-linux-gnu/librtmp.so.1 \
					/usr/lib/x86_64-linux-gnu/libsasl2.so.2 \
					/usr/lib/x86_64-linux-gnu/libsqlite3.so.0 \
					/usr/lib/x86_64-linux-gnu/libssl.so.1.1 \
					/usr/lib/x86_64-linux-gnu/libstdc++.so.6 \
					/usr/lib/x86_64-linux-gnu/libtasn1.so.6 \
					/usr/lib/x86_64-linux-gnu/libunistring.so.2 \
					/usr/lib/x86_64-linux-gnu/libwind.so.0
	mkdir upload || true
	cd upload/
	zip -r upload/$(LAYER_ZIP) bootstrap $(SHARED_LIBS_FOLDER)
